---
title: "Email to Powershell Task Using Azure Functions"
date: 2023-11-17T09:18:14+13:00
featured: true
description: "We recreated a process flow to use powershell in Azure Functions to capture an email via a web call and then send it to an Azure Storage Queue to be picked up and processed by a Powershell script running as a CronJob in our Kubernetes cluster."
tags: ["kubernetes","automation","azure-functions","powershell"]
image: "https://azure.microsoft.com/svghandler/functions/?width=200&height=150"
link: "XML Email Flow to SQL Server Using Powershell"
fact: "Email Attachment Processed using an Azure Function and Powershell"
weight: 500
sitemap:
  priority : 0.8
draft: false
---

## Intro

We had a challenge where an existing SSIS Package was not behaving as expected. This provided a good scenario for a rebuild in a new platform to align with our plans for the future.

As we intend to move to Azure SQL Database we will not have an SSIS platform to execute tasks. So moving forward the intention for scheduled tasks is to use CronJobs in a Kubernetes cluster.

The process is a task used to receive a message about an inbound train with empty wagons, ready to be loaded with logs. This will be used to create entities in the database that can be used by staff to record what has been loaded.

## Existing Solution

The incoming data is in the form of an XML Attachment to an email.
The existing solution uses an application ([AttachmentSave from MAPILab](https://www.mapilab.com/exchange/attachment_save/)) on the local Exchange server to save the attachment to an SMB share and then renames the attachment in the mailbox it is being sent to.

An SSIS Job then runs every 5 minutes;

- Check if there is a file.
- If there is then perform as series of preparation tasks. This includes making sure the sender is valid, making sure the train exists, and making sure the wagon entity exists.
- Archive the file into a secondary location.

## Solution Outline

Using [Mailgun](https://www.mailgun.com) we can receive and email and send the data to a web api. So I created an Azure Function to receive the email and send it to an Azure Storage Queue.

While we are running SQL Server on premise it makes sense to run the task locally as well. Once we move the database to the cloud or securely connect Azure to our datacenter, we can use storage triggers to initiate the processing.

For now we are triggering using a cronjob to run a container in an on-premise kubernetes cluster. This runs every 5 minutes as before. Checking if there is any data in the queue.

## Primary Learnings

1. There was a major blockage attempting to understand what data is being sent by Mailgun. It is using the standard 'Content-Type: multi-part/formdata'. However this is not a native format to Powershell so I first had to create a parser for this data. Once I captured a sample API Call, I was able to debug and make local calls for testing instead of needing to send an email each time.
1. Part of this solution is to record telemetry so I also built a module for sending Application Insights messages. This will be very helpful going forward.
1. Part of this solution used multiple modules so I also went through the process of setting up a nuget feed using Azure DevOps artifact feed as a PowershellGet package source.
