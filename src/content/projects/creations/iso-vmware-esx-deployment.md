---
title: "ISO Limited VMWare ESXi Deployment"
date: 2023-06-18T13:09:01+12:00
featured: true
image: /img/vmware_vsphere.webp
description: "Deployed VMWare ESX Servers and vSphere management on new hardware."
tags: ["vmware","virtualization","server","infrastructure"]
fact: "Interesting little tidbit shown below image on summary and detail page"
sitemap:
  priority : 0.8
---

## Beginning
There was a 5 Node Hyper-V Cluster using 2 different SANs.

This was supporting basically all of the production workloads for the business.
Including;
- SQL Server Always-On Cluster (2 Nodes)
- Other less demanding SQL Loads
- Web Servers (2 pairs for the main 2 apps + others)
- File Servers
- Exchange Server
- Various Infrastructure Servers

This was mostly working but capacity was nearing full and we had some struggles with MPIO and connecting to the SANs. Especially where if Veeam tried to snapshot particular VMs on particular hosts the storage would stop.

## The Plan
Purchase 2x new ESXi hosts which match the 2x newest Hyper-v hosts with the intention of eventually bringing them together in a 4x node VMWare cluster. Also there was a new SAN to add capacity and also work as store for VMWare while we migrate workloads.

## Execution
We first deployed the 2x ESXi / vSphere servers and join them to a vCenter cluster.
For most things we are able to use our Veeam backup and recovery software to live boot a backup and then migrate the storage to make the server live.

This however would be a days long migration for our database servers which is unacceptable for a 24/7 business.

So for our SQL Server Always on workload we opted for a swing type migration. We built a new / fresh host in the VMWare environment. Added it to the cluster. Transferred all the data. Then finally used the failover systems to switch to the new one as primary. When inevitably things didn't work we could fail back and fix the shortcoming before attempting again.

This provided a very safe way to get the job done with minimal interruption.