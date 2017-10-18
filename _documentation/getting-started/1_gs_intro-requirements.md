

---
layout: documentation
title: Introduction & Requirements
category: Getting-started
order: 1
---
*** HERE IS MY CHANGE -- MY CHANGE IS HERE ***
## Introducing SUSE Manager {#introducing-suse-manager}

SUSE Manager lets you efficiently manage large sets of Linux systems and keep them up to date. It provides automated and cost-effective software management, asset management, and system provisioning. SUSE Manager provides a best in class solution for organizations requiring absolute control of maintenance and package deployment on their servers. It allows customers the highest level of flexibility and power ensuring their servers remain secure while facilitating and advancing an organizations system life-cycle requirements.

- Salt.  The inclusion of `Salt` in SUSE Manager 3 provides powerful event-driven configuration and management capabilities for fine grained control of any modern infrastructure.

- Salt-master.  SUSE Manager 3.1 takes a commanding role as a Salt-master capable of orchestrating thousands of Salt-minions (SUSE Manager Clients) via remote execution.

- Distribution Management.  SUSE Manager 3.1 is also fully compatible with Red Hat Satellite Server and offers seamless management of both SUSE Linux Enterprise and Red Hat Enterprise Linux client systems.


## Overview {#overview}

SUSE Manager may be integrated within your network infrastructure in numerous ways. In this guide you will perform the following steps to get started quickly with a working setup.

1. Install SLES12 and SUSE Manager as an extension

2. Register SUSE Manager server with SCC (SUSE Customer Center)

3. Synchronize a repository channel for use with both traditional clients and salt-minions

4. Create an authentication key to act as an ID for the synced repository channel

5. Add the new authentication key to a bootstrap template script and connect a traditional client

6. Register a salt-minion with SUSE Manager (salt-master) and assign it a channel with an authentication key


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

#### Just Enough Operating System (JeOS) vs. Full Media Image {#Just-Enough-Operating-System-Image}
```
The SLES 12 JeOS image provides the quickest route for setup of a test environment. The JeOS image total size is about 240 MB.
The alternative would be the 3 GB SUSE Linux Enterprise Server 12 DVD image. Both installation media are appropriate,
but depend upon available bandwidth or your application needs. Both methods of installation will be covered in this guide.
```

*   Just Enough Operating System (JeOS) 240 MB [https://www.suse.com/products/server/jeos/](https://www.suse.com/products/server/jeos/)

*   SLES 12 DVD image 3 GB [https://www.suse.com/products/server/download/](https://www.suse.com/products/server/download/)


## Hardware Requirements {#hardware-requirements}

Review the following table for SUSE Manager hardware and software requirements. For installation on z Systems, see: `add link to zystems guide`


|Hardware | Recommended |
| --- | --- |
| CPU                | Multi-core 64-bit CPU (x86_64, ppc64le) |
| RAM                | Minimum 4 GB+ for test server |
|                    | Minimum 16 GB+ for base installation |
|                    |Minimum 32 GB+ for a production server |
| Free Disk Space    |Minimum 100 GB for root partition |
|                    |For the purposes of this guide the default JeOS root partition size of 24                               GB will be sufficient|
|                    |Minimum 50 GB for /var/lib/pgsql |
|                    |Minimum 50 GB per SUSE product + 100 GB per Red Hat product /var/spacewalk |



## Base Host OS {#base-host-os}

SUSE Manager is based on the following host OS.

### Version Information {#version-information}

SUSE Manager 3.1 was originally released as a SLES 12 SP2 extension. With the upcoming maintenance update (2017), SUSE Manager 3.1 will be based on SLES 12 SP3 and it will support SLE 12 SP3 clients officially. In the following sections and chapters, it is highly recommended to use SLE 12 SP3 instead of SP2.

| Base OS | SUSE Manager Version |
| --- | --- |
| SLES 12 SP3 | 3.0, 3.1 |



## Supported Client Systems {#supported-client-systems}

Clients with the following operating systems are supported for registration with SUSE Manager. If you plan on using the new Salt features, ensure your clients are supported.

>#### Supported Versions and SP Levels {#supported-versions-and-sp-levels}

>Client operating system versions and SP levels must be under general support (normal or LTSS) to be supported with SUSE Manager. For details, see [https://www.suse.com/lifecycle](https://www.suse.com/lifecycle).


| Operating Systems | Architecture | Traditional Clients | Salt Clients |
| --- | --- | --- | --- |
| SUSE Linux Enterprise 11 SP4 LTSS | x86, x86_64, Itanium, IBM POWER, z Systems | Supported | Supported |
| SUSE Linux Enterprise 12 SP1, SP2, SP3 | x86_64, IBM POWER (ppc64le), z Systems | Supported | Supported |
| Red Hat Enterprise Linux 5 | x86, x86_64 | Supported | Unsupported |
| Red Hat Enterprise Linux 6 | x86, x86_64 | Supported | Supported |
| Red Hat Enterprise Linux 7 | x86, x86_64 | Supported | Supported |
| Novell Open Enterprise Server 11, SP1, SP2, SP3 LTSS | x86, x86_64 | Supported | Supported |



## Additional Requirements {#additional-requirements}

To successfully complete this guide some network requirements must be met. The following section will walk you through these requirements.

Fully Qualified Domain Name (FQDN):  The SUSE Manager server must resolve its FQDN correctly or cookies will not work properly on the Web UI. For more information on FQDN, see:

*   [https://www.suse.com/documentation/sles-12/book_sle_admin/data/sec_basicnet_yast.html#sec_basicnet_yast_change_host](https://www.suse.com/documentation/sles-12/book_sle_admin/data/sec_basicnet_yast.html#sec_basicnet_yast_change_host)

Hostname and IP Address:  To ensure that SUSE Manager&#039;s domain name can be resolved by its clients, both server and client machines must be connected to a working Domain Name System (DNS) server. This guide assumes the required infrastructure exists within your environment. For more information on setting up a (DNS) server, see:

Using a Proxy When Installing from SUSE Linux Enterprise Media.  If you are on an internal network and do not have access to SUSE Customer Center, you can setup and use a proxy during a SUSE Linux Enterprise installation. For more information on configuring a proxy for access to SUSE Customer Center during a SUSE Linux Enterprise installation see:[https://www.suse.com/documentation/sled-12/singlehtml/book_sle_deployment/book_sle_deployment.html#sec.i.yast2.start.parameters.proxy](https://www.suse.com/documentation/sled-12/singlehtml/book_sle_deployment/book_sle_deployment.html#sec.i.yast2.start.parameters.proxy)

*   [https://www.suse.com/documentation/sles-12/book_sle_admin/data/cha_dns.html](https://www.suse.com/documentation/sles-12/book_sle_admin/data/cha_dns.html)

>#### Naming Your Server {#naming-your-server}

>The hostname of SUSE Manager must not contain uppercase letters as this may cause `jabberd` to fail. Choose the hostname of your SUSE Manager server carefully. Although changing the server name is possible, it is a complex process and unsupported.




## Firewall Rules {#firewall-rules}

In a production environment SUSE Manager server and its clients should always utilize firewall rules. The following table provides an overview of required ports for use by SUSE Manager 3.1.

Traditional client systems connect to SUSE Manager via port 443. In addition, enabling push actions from SUSE Manager to client systems, requires inbound connections on port 5222\. If SUSE Manager will also push to a SUSE Manager proxy, you must allow inbound connections on port 5269.

Table 1.1. Required Ports on SUSE Manager Server

| Port | Direction | Reason |
| --- | --- | --- |
| 67 | Inbound | Required when configured as a DHCP server for systems requesting IP addresses. |
| 69 | Inbound | Used when configured as a PXE server and allows installation and re-installation of PXE-boot enabled systems. |
| 80 | Outbound | Used to contact SUSE Customer Center. |
| 443 | Inbound | All Web UI, traditional client, and proxy server requests and SUSE Manager uses this port for SUSE Customer Center inbound traffic. |
| 4505 | Inbound /Outbound | Required by the Salt-master for communication via TCP to minions. |
| 4506 | Inbound /Outbound | Required by the Salt-master for communication via TCP to minions. |
| 5222 | Inbound | When you wish to push actions to clients this port is required by the `osad` daemon running on the client systems. |
| 5269 | Inbound/Outbound | Needed if you push actions to or via a SUSE Manager Proxy. |
|      | Outbound | Squid HTTP proxy for outgoing connections. It could be any port you configure. |
