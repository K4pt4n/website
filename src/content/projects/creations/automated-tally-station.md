---
title: "Automated Tally Station"
image: "/img/ats-entry.jpg"
description: "This project was initiated to remove human personnel from harm by eliminating the need for their presence on the wharf while loading a vessel with logs."
tags: [kubernetes,automation,safety,qrcode]
link: NA
fact: "QRCode Recognition from pictures taken with basler cameras"
draft: true
---

# Intro

Video showing the unit in action [ISO's Automatic Tally Station](https://www.youtube.com/watch?v=BjyXEOOvjJI)

This project was initiated to remove human personnel from harm by eliminating the need for their presence on the wharf while loading a vessel with logs.

We used a series of cameras to take photos of the log faces and then used python based qrcode recognition to detect the QRCodes in the photos.

We opted to use Kubernetes to host the workers to provide failover capability.

Being crucial to operations redundancy was a major concern in all systems.

# Technology Stack
- Python 3
- .NET
- SQL Server
- Kubernetes (Microk8s)
- Azure Service Bus
- Azure Blob Storage
- Azure Monitor
- Ubuntu
- Network Switches
  - Extreme
  - Konten
  - Mikrotik
- Teltonika
- Dell
- Raspberry Pi
- Raspberry Pi Pico
- Basler GBE Cameras
- Alien RFID Reader
- Lidar Sensors