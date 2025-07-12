---
layout: post
title: "Electronics Project: Custom Mechanical Keyboard"
author: "Niels Slotboom"
tags: Projects
excerpt_separator: <!--more-->
---

I started this project when I needed a new keyboard for my office. The simplest solution, of course, would have been to just buy one. But having previously experimented with small custom macro pads, I saw this as the perfect excuse to finally design and build my own fully custom mechanical keyboard.<!--more-->

In this post, I’ll showcase the keyboard I ended up building and walk through some of the design decisions and challenges I faced along the way.

<figure style="margin:0;">
  <img src="{{ site.baseurl }}/assets/keyboard/low/keyboard.jpg" alt="Custom Mechanical Keyboard" style="max-width:100%; height:auto;">
  <figcaption><a href="{{ site.baseurl }}/assets/keyboard/keyboard.jpg" target="_blank">View full resolution</a></figcaption>
</figure>

In earlier projects, I’d used pre-made ATMEGA32U4 development boards, which could be soldered directly to a keyboard PCB without worrying much about the microcontroller's support circuitry. This time, I wanted a cleaner, more integrated design. That meant laying out the power delivery, filtering, crystal oscillator, and IO routing myself—something I hadn’t done before.

Fortunately, there’s plenty of information available online, and I managed to cobble together a working circuit based on the ATMEGA32U4 chip. Here's the result:
<figure style="margin:0;">
  <img src="{{ site.baseurl }}/assets/keyboard/low/circuit.jpg" alt="ATMEGA32U4 Microcontroller Circuit" style="max-width:100%; height:auto;">
  <figcaption><a href="{{ site.baseurl }}/assets/keyboard/circuit.jpg" target="_blank">View full resolution</a></figcaption>
</figure>
The ATMEGA32U4 has two key advantages: it includes native USB support (so it can be connected directly to a USB port) and it offers a generous number of general-purpose IO pins. I used these pins to connect the rows and columns of the keyboard's switch matrix—the relevant pins are labelled `row0–4` and `col0-14` in the image above.

Having completed the circuit, it was time to design the printed circuit board (PCB) to mount and connect all components. I created the layout in KiCAD as a two-layer board—which is fortunately sufficient for something like a keyboard. The resulting design looked like this:
<figure style="margin:0;"> 
  <img src="{{ site.baseurl }}/assets/keyboard/pcb_design.svg" alt="PCB Design in KiCAD" style="max-width:100%; height:auto;">
</figure>
As expected, the switch-and-diode matrix takes up most of the surface area, while the ATMEGA32U4 circuitry is neatly tucked away beneath the space bar at the bottom. After sending the design files off to JLCPCB and waiting a few weeks, five pristine white PCBs arrived at my door. Here’s an impression of the finished, still unpopulated boards:
<figure style="margin:0;">
  <img src="{{ site.baseurl }}/assets/keyboard/low/pcb_photo.jpg" alt="Close-Up of the PCB" style="max-width:100%; height:auto;">
  <figcaption><a href="{{ site.baseurl }}/assets/keyboard/pcb_photo.jpg" target="_blank">View full resolution</a></figcaption>
</figure>
Populating the board proceeded in two passes. In the first, I used a solder paste stencil to apply paste to all the pads for the surface-mount components. These were then placed onto the board using tweezers. Once everything was roughly aligned, I reflowed the solder using a heat gun. In the second pass, I soldered the through-hole components—mainly the switches and diodes—by hand, one at a time.

At this point, I decided to go all-in and design a custom case to be CNC-machined—a service conveniently offered by JLCPCB as well. The case consists of two parts, a top and a bottom, which "sandwich" the PCB between them, held together by four screws in the corners.

In hindsight, I should have included additional screws at the midpoints of the long edges. Without them, the two halves don’t hold together as securely as they could and are prone to slight shearing under pressure. Another design improvement would have been to give the case a steeper typing angle for better ergonomics—but that’s easily fixed by propping up the back feet with a spacer or two.

Despite these oversights, the keyboard is fully functional and in daily use. Thanks to the use of QMK, a powerful and highly customisable firmware for mechanical keyboards, the keymaps can be easily reconfigured to suit different workflows. And who knows—maybe one day I’ll design a full-size version that addresses these points as well.