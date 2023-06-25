---
slug: '2023-06-21-mikrotik-mlag-trunking'
title: "Lessons learned from trunking 2x Konten Switches with 2x Mikrotik Switches using MLAG"
date: 2023-06-21T15:22:12+12:00
draft: false
featured: true
tags: [kubectl, microk8s, kubernetes, ssl, certificates]
---

Intro
-----
We have a setup with 2x Mikrotik CRS326-24S+2Q+RM core switches that link off to 2x Industrial switches with 4x 10Gbps each.

The goal is to use MLAG for Multi-Switch redundancy. For reasons we had the downlink switches setup with vlans. I had attempted to isolate uplink traffic by VLAN.

However since MLAG or whatever loop protectection exists (with stp off) is not a Layer-2 protocol and therefore has an issue with with there being multiple paths to the downlink switch.

So I had to ditch the VLAN separation and put all the links into a single MLAG in this case 2 fibres going to each Mikrotik from each Industrial Switch.

Summary
-----
If you are using MLAG all physical links to downstream switches must be in a single bond.