---
title: Prerequisites and Requirements
keywords: prerequisites
sidebar: sumadoc_sidebar
permalink: prerequisites-requirements.html
toc: false
summary: Get started with SUSE Manager 3 by setting up a KVM learning environment. This quick-start guide will provide you with introductory guidance on setting up SUSE Manager server. You will learn the basics of managing both traditional SUSE Manager clients and Salt clients. This guide is intended for system administrators.
---


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

### Just Enough Operating System (JeOS) vs. Full Media Image {#just-enough-operating-system-jeos-vs-full-media-image}

The SLES 12 JeOS image provides the quickest route for setup of a test environment. The JeOS image total size is about 240 MB. The alternative would be the 3 GB SUSE Linux Enterprise Server 12 DVD image. Both installation media are appropriate, but depend upon available bandwidth or your application needs. Both methods of installation will be covered in this guide.

*   Just Enough Operating System (JeOS) 240 MB [https://www.suse.com/products/server/jeos/](https://www.suse.com/products/server/jeos/)

*   SLES 12 DVD image 3 GB [https://www.suse.com/products/server/download/](https://www.suse.com/products/server/download/)