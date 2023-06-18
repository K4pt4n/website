---
title: "How to Renew Cluster Certificates When Using Microk8s"
date: 2023-06-18T15:22:12+12:00
draft: false
featured: true
tags: [kubectl, microk8s, kubernetes, ssl, certificates]
---

Intro
-----
By default microk8s signs the server certificates for 365 days.
Once this expires the cluster apis stop working with kubectl.

Solution
-----
Run the following in order to check the Certificate validation.
``` bash
sudo microk8s refresh-certs --check
```
