---
layout: post
title: "The ADM Action and Differential Geometry on Foliations"
author: "Niels Slotboom"
tags: Academic Notes
excerpt_separator: <!--more-->
---

This post is a continuation of my journey to understand the ADM formalism, which began with my review of Hamiltonian field theory and the Dirac-Bergmann algorithm in [this post]({{ site.baseurl }}/2025-07-04/dirac-bergmann). Below is an overview of the topics covered in my learning process as well as the notes that I wrote throughout.<!--more-->

[Direct Link to the PDF]({{ site.baseurl }}/assets/pdf/foliation-geometry.pdf)

The ADM formalism recasts general relativity into a Hamiltonian field theory. To do so, a preferred time coordinate $$t$$ is introduced, which assigns to every point $$p$$ in spacetime a coordinate time $$t(p)$$. Surfaces of equal time, given by
\\[
    \Sigma_{t_0} = \\{p \in \mathcal{M} \;|\; t(p) = t_0\\}
\\]
"foliate" the spacetime $$\mathcal{M}$$ into spacelike hypersurfaces termed "leaves". Amending the time coordinate $$t$$ to a full coordinate system $$x^\mu = (t,y^i)$$ by spatial coordinates $$y^i$$, one can perform the so-called ADM split of the metric $$g$$, in which its components read
\\[
    g_{t t} = -\alpha^2 + \gamma_{ij} \beta^i\beta^j, \qquad g_{ti} = \gamma_{ij}\beta^j,\qquad g_{ij} = \gamma_{i j}.
\\]
Here, $$\alpha$$ and $$\beta = \beta^i \partial_i$$ are the lapse function and the shift vector, while the $$\gamma_{i j}$$ denote the components of the induced metric on the equal-time surfaces $$\Sigma_{t_0}$$. The lapse and shift are related to the normal vector field of the foliation.

Given this decomposition of the metric, it becomes clear that the variables of the theory are the functions $$\alpha$$, $$\beta_i = \gamma_{ij} \beta^j$$ and $$\gamma_{i j}$$. The first step in transitioning from the Einstein-Hilbert action
\\[
    S_{\text{EH}}[g] = \int_\mathcal{M} d^m x \, \sqrt{g} \mathcal{R}
\\]
to a Hamiltonian field theory is to compute the canonical momenta associated with the variables of the theory. This is done by computing the functional derivatives of the action $$S_\text{EH}$$ with respect to $$\partial_t \alpha$$, $$\partial_t \beta_i$$ and $$\partial_t \gamma_{i j}$$, respectively. With the above expression for the action, however, such a computation isn't straightforward to carry out. It is unclear how the Ricci scalar $$\mathcal{R}$$ depends on the variables of the theory---it is necessary to derive a decomposition of it in terms of $$\alpha$$, $$\beta_i$$ and $$\gamma_{ij}$$. 

Concretely, this decomposition is known as the ADM action, reading
\\[
    S_\text{ADM}[\alpha,\beta,\gamma] = \int_\mathcal{M} d^m x \, \alpha\sqrt{\gamma}\left[\bar{\mathcal{R}}-(k^2 - k_{ij}k^{ij}) \right] + (\text{boundary terms}).
\\]
Here, $$\bar{\mathcal{R}}$$ denotes the Ricci scalar intrinsic to the foliation leaves $$\Sigma_t$$---that is, it is associated only with the induced metric $$\gamma$$. Further, the $$k_{ij}$$ are the components of the so-called extrinsic curvature of the leaves, with $$k = \gamma^{ij} k_{ij}$$ its trace. Since the extrinsic curvature can be expressed as
\\[
    k_{i j} = -\frac{1}{2\alpha} \left(\partial_t \gamma_{i j} - (\bar\nabla_i \beta)_j - (\bar\nabla_j \beta)_i\right),
\\]
with $$\bar\nabla$$ indicating the induced connection on the leaves, it is confirmed that the ADM action above indeed provides us with a decomposition of the Einstein-Hilbert action in terms of $$\alpha$$, $$\beta_i$$ and $$\gamma_{ij}$$. In particular, we can see that the only components of the metric appearing with time derivatives are the $$\gamma_{ij}$$---the lapse and shift are non-dynamical.

The above introduction of the ADM formalism is of course very brief. I have tried to capture in it the essence of what sparked my interest, while the notes below provide the necessary context required to arrive at the result. The aim of these 81 pages is to build up all the mathematical machinery on which the ADM action rests, and then to derive it in the final section. To this end, we begin with the basic definitions of submanifolds and induced metrics, and then move on to pushforwards, pullbacks, and vector bundles. Once these foundations are in place, foliations are introduced, together with their tangent and normal bundles and the corresponding projection operators. Connections are then reviewed in a general setting, which allows induced connections to be defined, and the inheritance of the Levi-Civita property is established. With a notion of parallel transport available, one can define both ambient and intrinsic curvature, and pose the question of how they are related. Introducing the extrinsic curvature leads naturally to the Gauss–Codazzi equation, which expresses the intrinsic curvature in terms of the pulled-back ambient and extrinsic curvatures. With this in hand, the final push becomes possible: the derivation of the ADM action.

I enjoyed learning about all these notions from differential geometry tremendously, and arriving at such a fundamental result has been very satisfying. In compiling these notes, I did not follow a textbook or article, but instead tried to reconstruct the necessary concepts and derivations step by step for myself. The result is not new mathematics, of course, but a self-contained path to the ADM action that I found rewarding to work through. Along the way, I have tried to bridge the gap between coordinate-free and component-based notation as much as possible, and I include worked examples to clarify the abstract constructions. My hope is that these notes will serve not only as a reference for myself, but also as a resource for others who might be curious about ADM, or more generally about the differential geometry of foliations and submanifolds.

[Direct Link to the PDF]({{ site.baseurl }}/assets/pdf/foliation-geometry.pdf)

<iframe src="{{ site.baseurl }}/assets/pdf/foliation-geometry.pdf" width="100%" height="1000px">
    This browser does not support PDFs. Please download the PDF to view it: 
    <a href="{{ site.baseurl }}/assets/pdf/foliation-geometry.pdf">Download PDF</a>.
</iframe>