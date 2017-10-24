---
title: Hardware/Software Requirements
keywords: hardware requirements
sidebar: sumadoc-31_sidebar
permalink: hardware-and-software-requirements.html
folder: suse-mgr3.1/getting-started/overview
toc: false
---

## Base Host OS {#base-host-os}

SUSE Manager is based on the following host OS.

| Base OS | SUSE Manager Version |
| --- | --- |
| SLES 12 SP3 | 3.0, 3.1 |

{% include tip.html content="SUSE Manager 3.1 was originally released as a SLES 12 SP2 extension. With the next maintenance update (2017), SUSE Manager 3.1 will be based on SLES 12 SP3 and it will support SLE 12 SP3 clients officially. In the following sections and chapters, it is highly recommended to use SLE 12 SP3 instead of SP2." %}



## Hardware Requirements {#hardware-requirements}

Review the following table for SUSE Manager hardware and software requirements.

| Hardware | Recommended |
| --- | --- |
| CPU | Multi-core 64-bit CPU (x86_64)                |
| RAM | Minimum 4 GB+ for test server                 |
| Free Disk Space | Minimum 100 GB for root partition |
|                 | Minimum 50 GB for /var/lib/pgsql  |
|                 | Minimum 50 GB per SUSE product + 200 GB per Red Hat product /var/spacewalk |

