---
layout: post
title: "Making CUDA Kernels Readable: A Generic Functor-Based Launcher"
author: "Niels Slotboom"
tags: Academic Programming
excerpt_separator: <!--more-->
---

In this post, I present a CUDA kernel abstraction layer I developed to reduce boilerplate and make the purpose of computational kernels explicit. While CUDA isn’t exactly known for its elegance, a modest layer of abstraction can go a long way in making even low-level kernel code clean, readable, and maintainable. <!--more-->

This work grew out of a follow-up effort to my [bachelor thesis]({{ site.baseurl }}/2023-09-11/bachelor-thesis), in which I rewrote the thesis’s software component from the ground up in modern CUDA C++. The aim was to provide a clean, maintainable, and extensible foundation for the ongoing research project, after the initial proof of concept had been achieved using the CUDA C implementation developed within the scope of the thesis.

The core computational tasks in my [bachelor thesis]({{ site.baseurl }}/2023-09-11/bachelor-thesis) revolve around grid-based operations—that is, applying a certain procedure to every element of a grid. With suitable index arithmetic, such a grid can always be "flattened" into a one-dimensional array, which is the fundamental assumption behind the generic kernel implementation:

```cpp
template <typename DeviceFunctor>
__global__ void generic_kernel(DeviceFunctor functor) // take functor as argument
{
    // iterate through the number of elements it specifies with functor.elemCount
    for (size_t idx = (size_t) (blockDim.x) * blockIdx.x + threadIdx.x;
         idx < functor.elemCount; 
         idx += (size_t) (blockDim.x) * gridDim.x)
    {
        // for each element, call the functor with the element's index
        functor(idx);
    }
}
```
<br>
Given an argument `functor` of some generic `DeviceFunctor` type, this kernel iterates over all elements specified by `functor.elemCount`, invoking the functor's `operator()` for each element. The result is a fully generic CUDA kernel that can launch any compute operation on a per-element basis, as long as the functor

* implements `operator()`,
* provides a correctly initialised `DeviceFunctor::elemCount` member,
* and internally contains or has references to all data it needs to operate.

Beyond this, the implementation of the `DeviceFunctor` type is arbitrary---one can choose to give it any desired functionality. 

In object-oriented programming, every time such a common interface shows up (particularly with no C++20 concept to enforce it), it makes sense to define a common base type each concrete implementation inherits from. In this case, I chose to implement such a `DeviceFunctorBase` struct as follows:
```cpp
template <typename Derived>
struct DeviceFunctorBase {
    size_t elemCount; ///< The number of elements to process

    // enforce the elemCount member to be populated
    DeviceFunctorBase() = delete;
    DeviceFunctorBase(size_t elemCount) : elemCount(elemCount) {}

    // this overload makes the struct a functor
    __device__ void operator()(size_t idx) {
        if (checkBounds(idx)) {
            // Forward the call to the derived class's invoke method
            static_cast<Derived*>(this)->invoke(idx);
        }
    }

    __device__ bool checkBounds(size_t idx) { return idx < elemCount; }
};
```
<br>
This base struct has a single data member `elemCount`, as required by the interface defined for `generic_kernel`. Explicit deletion of the empty default constructor  enforces the `elemCount` member to be set---one cannot forget about it, else the compiler will complain. The `operator()` overload is generic, and only executes a minimal bounds check on the passed index `idx` using `checkBounds()`, forwarding the actual per-element compute implementation to the `Derived` class.

Note here that this forwarding follows classic [CRTP](https://en.wikipedia.org/wiki/Curiously_recurring_template_pattern) using a `static_cast` of the `this` pointer to the type of the derived struct. This form of static polymorphism is necessary because CUDA device code does not support dynamic polymorphism via `virtual` functions. The reason is that CUDA lacks support for the full C++ runtime on the device, including vtables, which are strictly required for dynamic dispatch. As a result, the implementation of any virtual-like behaviour must be resolved at compile time—which is exactly what CRTP achieves through static dispatch.

A concrete example speaks more than a thousand words, so let us consider a derived implementation of `DeviceFunctorBase`. More specifically, we take a look at a functor implementation `AddFunctor` that provides us with the ability to add two arrays of the same size element-wise and output the result into a third. Such a functor can be implemented as follows:
```cpp
template <typename T>
struct AddFunctor : public DeviceFunctorBase<AddFunctor<T>> {
    T* in1, in2; // device pointers to input arrays
    T* out;      // device pointers to output array

    // parameterised constructor initialising all members
    AddFunctor(size_t elemCount, T* in1, T* in2, T* out) 
    : DeviceFunctorBase<AddFunctor<T>>(elemCount),
      in1(in1), in2(in2), out(out) {}

    // actual compute implementation
    void invoke(size_t idx) {
        out[idx] = in1[idx] + in2[idx];
    }
};
```
<br>
This implementation is rather simple: We have to give the functor struct access to all the data it needs via the members `in1`, `in2` and `out`, which are initialised via a standard parameterised constructor. The core compute is then a one-line method performing the addition and assignment of the result to `out[idx]`, without ever having to worry about how the kernel ensures the full array is covered---everything a derived implementation needs to do is to provide its own data and know how to perform the computation for a single grid index. Of course, this is not limited to using data only belonging to `idx`---you can also, for instance, use neighbouring data for things like finite difference stencils, provided one does the appropriate index arithmetic to access them. 

Further, executing this `AddFunctor` is as simple as writing
```cpp
size_t elemCount;
T* a,b,c;

// allocate a,b,c on device, populate a,b with data...

AddFunctor add_functor(elemCount, a, b, c); // create functor instance
generic_kernel<<<128,128>>>(add_functor);   // launch kernel, 128 blocks of 128 threads
```
<br>
In the codebase for my reimplementation, I also introduced an abstraction for device/host memory allocation and transfer. This removes the need to deal with the low-level CUDA C API entirely and provides a higher-level interface focused entirely on per-element computation, rather than boilerplate for kernel execution.