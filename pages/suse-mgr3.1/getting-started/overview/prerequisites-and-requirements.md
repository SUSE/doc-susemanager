---
title: Prerequisites and Requirements
keywords: prerequisites
sidebar: sumadoc-31_sidebar
permalink: prerequisites-and-requirements.html
folder: suse-mgr3.1/getting-started/overview
toc: false
summary: Get started with SUSE Manager 3 by setting up a KVM learning environment. This quick-start guide will provide you with introductory guidance on setting up SUSE Manager server. You will learn the basics of managing both traditional SUSE Manager clients and Salt clients. This guide is intended for system administrators.
---


## Overview {#overview}

SUSE Manager may be integrated within your network infrastructure in multiple ways. In this guide you will perform the following steps for your first setup.

*   Install SLES12 and SUSE Manager as an extension

*   Register SUSE Manager server with SCC (SUSE Customer Center)

*   Synchronize a repository channel for use with both traditional clients and salt-minions

*   Create an authentication key to act as an ID for the synced repository channel

*   Add the new authentication key to a bootstrap template script and connect a traditional client

*   Register a salt-minion with SUSE Manager (salt-master) and assign it a channel with an authentication key

## Prerequisites for Installation {#prerequisites-for-installation}

This guide requires that you have created an account with SCC (SUSE Customer Center). During installation of both SUSE Linux Enterprise Server 12 and SUSE Manager 3.1, SUSE Customer Center credentials will be requested and you must enter them to receive the latest packages and updates. The following procedure will guide you through obtaining your SCC `Organizational Credentials`.

Procedure 1.1. Obtaining Your SCC Organization Credentials

1.  Open a browser and direct it to [https://scc.suse.com/login](https://scc.suse.com/login).

2.  If you have not done so, create an account now.

3.  Log in to your new SCC account.

4.  Under the `Management tools` widget select `Manage Users`.

5.  Click the `Organization Credentials` tab.

6.  Keep this information handy during SUSE Manager 3 setup.


## Obtaining Installation Media {#obtaining-installation-media}

After logging into your SCC account, you can find the installation images provided at the following addresses. Select one and continue reading:

*   Just Enough Operating System (JeOS) 240 MB [https://www.suse.com/products/server/jeos/](https://www.suse.com/products/server/jeos/)

*   SLES 12 DVD image 3 GB [https://www.suse.com/products/server/download/](https://www.suse.com/products/server/download/)


{% include tip.html content="The SLES 12 JeOS image provides the quickest route for setup of a test environment. The JeOS image total size is about 240 MB. The alternative would be the 3 GB SUSE Linux Enterprise Server 12 DVD image. Both installation media are appropriate, but depend upon available bandwidth or your application needs. Both methods of installation will be covered in this guide." %}

## Hardware Requirements {#hardware-requirements}

The following table provides hardware and software requirements for SUSE Manager.

| Hardware | Recommended |
| --- | --- |
| CPU | Multi-core 64-bit CPU (x86_64) |
| RAM | Minimum 4 GB+ for test server |
| Free Disk Space | Minimum 100 GB for root partition |