---
slug: radfords-vte
title: Radfords Virtual Training Environment
date: 2018-06-01T12:00:00+12:00
image: /img/radfords.jpg
description: 'There was a need to be able to have Radfords multiple systems connected together with useful "Base Data" as a starting point.'
fact: Training Environment that can be setup and reset anytime.
tags: [powershell,sqlserver,iis,.net,sqllocaldb]
draft: false
featured: false
weight: 500
sitemap:
    priority: 0.8
---

## The Need

Whenever there was a new staff member there was no way to consistently train them without extra work.

The complete solution involved multiple applications and databases which need to be connected together with common information.

## The Solution

Create a series of scripts to automate the setup the infrastructure and data to have a fully working environment.

Scripts include steps to reset data back to a known state.

Training data and lessons were created by a co-worker who understood the process well.

## Specific Learnings

- Powershell scripting.
  - Extensive scripts were used in order to correctly configure appropriate machine level settings.
- Custom Powershell modules.
  - Supporting scripts were stored in modules in order to help declutter the main content of the script.
- SQL Server LocalDB.
  - All applications are backed by SQL Server databases. Since SQL Server is complicated to setup, I opted to use SQL LocalDB. This was the restore process is just to copy the mdf/ldf files, overwriting the existing ones.
- Powershell Desired State Configuration.
  - There are a few requirements in order to function. In order to simplify installation I made use of Powershell Desired State Configuration in order to consistently install the dependencies.
