---
layout: gallery
title: "Gallery of Photographs"
author: "Niels Slotboom"
permalink: /gallery/
text: "Photography is a pastime of mine. I enjoy capturing all sorts of scenes that offer interesting composition, lighting, or displays of colour—whether in architecture, nature, or more technological subjects. This page serves as a gallery of some of my favourite photographs from the past few years.
<br><br>
I shoot primarily with a Sony A7II body, paired with various lenses, most often primes. Over the past few years, I’ve developed a particular fascination with anamorphic lenses. Unlike traditional lenses that use only spherical elements, these incorporate planoconvex or concave glass that effectively “squishes” the field of view horizontally. When the image is later stretched back to its correct proportions in post-processing, it yields a strikingly wide aspect ratio, reminiscent of cinema. This is no coincidence: anamorphic lenses were originally introduced to preserve wide framing on film stock that had lost usable width to the new sound tracks.
<br><br>
Beyond just the aspect ratio, anamorphic lenses introduce unique optical aberrations—prominent horizontal lens flares when facing bright lights, or bokeh that’s oval rather than circular. This is what I enjoy most about using them: they give an unusual, cinematic quality that makes intriguing scenes stand out even more."
---

{% assign images = "10.jpg,20.jpg,30.jpg,40.jpg,50.png,60.png,70.png" | split: "," %}

{% for img in images %}
<figure>
  <img src="/assets/gallery/{{ img }}" alt="Photo {{ forloop.index }}" style="max-width:100%; height:auto;">
  <figcaption><a href="/assets/gallery/{{ img }}" target="_blank">View full resolution</a></figcaption>
</figure>
{% endfor %}
