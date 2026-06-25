---
layout: post
title: "Part III Essay: General Relativity as a Dynamical PDE"
author: "Niels Slotboom"
tags: Academic Thesis
excerpt_separator: <!--more-->
---

During my Part III MASt in theoretical physics at the University of Cambridge, I wrote an essay on the topic of general relativity as a dynamical partial differential equation (PDE), an essay topic set by Rita Teixeira da Costa. Following a study of how to interpret general relativity as a dynamical system, this essay synthesises the 1969 proof by Choquet-Bruhat and Geroch which showed that the Einstein field equations are well-posed.<!--more-->

[Direct Link to the PDF]({{ site.baseurl }}/assets/pdf/part-iii-essay.pdf)

The starting point of the essay lies in the reconstruction of the ADM decomposition of the metric into the lapse $$\alpha$$, the shift $$\beta$$ and the spatial metric $$\gamma$$, as well as its normal derivative, the extrinsic curvature $$K$$. From this decomposition, the normal-normal and normal-tangential components of the Einstein tensor with respect to the chosen foliation, $$G_{\perp\perp}$$ and $$G_{\perp i}$$, are derived. These components establish that solutions to the vacuum Einstein equations must satisfy the constraint equations
\\[
    \bar{R} + K^2 - K_{ij} K^{ij} =0 \quad\text{and}\quad \bar\nabla_i (K^{i j} - \gamma^{i j} K) = 0.
\\]
Here, $$\bar\nabla$$ denotes the intrinsic Levi-Civita connection with respect to $$\gamma$$, $$\bar{R}$$ its associated scalar curvature, and $$K = \gamma^{i j} K_{i j}$$ the trace of the extrinsic curvature. Finally, a brief argument involving the Bianchi identities $$\nabla^\mu G_{\mu \nu} = 0$$ is employed to establish that the constraint equations hold at all times given that they hold initially and that the remaining Einstein equations, $$G_{i j} = 0$$, are satisfied.

The next part of the essay is dedicated to bringing the vacuum Einstein equations, recast as $$R_{\mu\nu} = 0$$, into a form where local PDE existence and uniqueness results hold. Explicitly, this is achieved by a specific choice of gauge, imposed conveniently using the _Bochner formula_, which reads
\\[
    \frac{1}{2} \Box_g (\nabla_a \varphi \nabla^a \psi ) = \frac{1}{2} (\nabla_a \Box_g \varphi) \nabla^a \psi + \frac{1}{2} \nabla_a \varphi (\nabla^a\Box_g \psi)\\ + \nabla_a\nabla_b \varphi \nabla^a \nabla^b \psi + R^{a b} \nabla_a \varphi \nabla_b \psi
\\]
for two scalar functions $$\varphi,\psi \in C^\infty (\mathcal{M})$$. By choosing $$\varphi,\psi$$ to be coordinate functions, and imposing the harmonic gauge condition $$\Box_g x^\mu = 0$$, the Ricci tensor in these coordinates reduces to
\\[
    R_{\mu \nu} = -\frac{1}{2} g^{\lambda\rho} \partial_\lambda \partial_\rho g_{\mu \nu} + g^{\lambda \rho} g^{\sigma \tau} \partial_\lambda g_{\mu \sigma} \partial_\rho g_{\nu\tau} - \Gamma_{\mu\rho\sigma}\Gamma_\nu{}^{\rho \sigma}.
\\]
Since the only second-order piece takes the wave-operator type form "$$\Box_g g = ...$$", the character of the Einstein equations $$R_{\mu\nu} = 0$$ is explicitly revealed to be hyperbolic, and standard local PDE existence and uniqueness results for quasilinear wave equations directly apply.

Finally, the essay turns towards proving the result first shown by Choquet-Bruhat and Geroch in 1969 which states that given initial data $$(\Sigma,\gamma,K)$$ on some initial surface $$\Sigma$$, subject to the constraint equations, there exists a unique, globally hyperbolic development of this initial data which is an extension of any other development. To establish this result, the local existence and uniqueness results (in PDE language, that is, in terms of functions) are translated into geometric statements in the form of Theorems 5.1 and 5.2. Then follows the proof of the Choquet-Bruhat--Geroch theorem; In this proof, Zorn's lemma is employed to first obtain the existence of a maximal development by showing that all chains have an upper bound. Thereafter, the fact that such a maximal development extends any other is established by showing that given any other development, a development which extends both can be constructed. By maximality, this constructed development must coincide with the maximal development, proving the desired property.

[Direct Link to the PDF]({{ site.baseurl }}/assets/pdf/part-iii-essay.pdf)

<iframe src="{{ site.baseurl }}/assets/pdf/part-iii-essay.pdf" width="100%" height="1000px">
    This browser does not support PDFs. Please download the PDF to view it: 
    <a href="{{ site.baseurl }}/assets/pdf/part-iii-essay.pdf">Download PDF</a>.
</iframe>