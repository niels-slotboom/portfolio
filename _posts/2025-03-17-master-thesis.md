---
layout: post
title: "Master Thesis: Schwarzschild Quasinormal Modes via the Penrose Limit"
author: "Niels Slotboom"
tags: Academic Thesis
excerpt_separator: <!--more-->
pdf_link: "/assets/pdf/master-thesis.pdf"
---

Full thesis title:
<h2>Recovering the Eikonal Quasinormal Mode Spectrum of the Schwarzschild Black Hole via the Penrose Limit</h2>
<!--more-->

[Direct Link to the PDF]( {{ site.baseurl }}/{{ page.pdf_link }} )

This thesis was written at the University of Bern under the supervision of Matthias Blau. It investigates the eikonal quasinormal mode (QNM) spectrum of the Schwarzschild black hole, and, in particular, how this spectrum can be recovered from a Penrose limit of the spacetime onto an equatorial photon ring geodesic at \\(r = 3 M\\). 

QNMs form a class of solutions to the wave equation—characteristic oscillation modes of a black hole spacetime under perturbations, encoding how it settles back to equilbirium. As such, they are expected to play a central role in processes such as the ringdown phase following a black hole merger. Their theoretical prediction is thus essential for testing general relativity using gravitational wave observations. This thesis presents three analytical approximation methods to compute the eikonal QNM spectrum of the Schwarzschild spacetime.

The first two methods are based on the WKB approximation of the radial wave equation and the geometric optics approximation, respectively. Both reproduce the well-known eikonal QNM spectrum,
\\[
  \omega_{n \ell} = \frac{1}{3\sqrt{3} M} \left(\ell + \frac{1}{2}\right) - \frac{i}{3\sqrt{3} M} \left(\ell + \frac{1}{2}\right),
\\]
where \\(M\\) denotes the Schwarzschild mass parameter. The analysis using these methods also provides the qualitative insight that the QNM spectrum is predominantly determined by the shape of the radial potential near its maximum, located close to the photon sphere.

The third approach involves solving the wave equation within the Penrose limit of the Schwarzschild geometry, taken along an equatorial photon ring geodesic. This limit provides a local approximation of the spacetime near the null geodesic—in this case, the region around the photon sphere, which has been identified as the primary factor shaping the QNM spectrum. While this method yields the same QNM spectrum, the underlying reason for this agreement is not immediately clear—beyond the fact that we approximate the spacetime around the correct region. The resolution lies in the observation that certain approximate symmetries of the Schwarzschild spacetime, local to this "near-ring region", become exact in the Penrose limit, giving rise to the isometry algebra of the associated plane wave spacetime. Moreover, the fundamental mode of the plane wave solution lifts to a specific near-ring solution in Schwarzschild, completing the correspondence. 

Writing this thesis gave me the chance to work through a wide range of topics in general relativity and differential geometry—from the Penrose limit, Killing fields, and curvature, to the Hamilton-Jacobi equation, geometric optics, and group contractions—and to dive into longer analytical derivations than I’d previously attempted.

<iframe src="{{ site.baseurl }}/{{ page.pdf_link }}" width="100%" height="1000px">
  This browser does not support PDFs. Please download the PDF to view it: 
  <a href="{{ site.baseurl }}/{{ page.pdf_link }}">Download PDF</a>.
</iframe>