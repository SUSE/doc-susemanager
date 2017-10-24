---
title: Overview
keywords: overview
tags: [overview]
sidebar: sumadoc_sidebar
permalink: overview.html
toc: false
summary: Get started with SUSE Manager 3 by setting up a KVM learning environment. This quick-start guide will provide you with introductory guidance on setting up SUSE Manager server. You will learn the basics of managing both traditional SUSE Manager clients and Salt clients. This guide is intended for system administrators.
---
## Introducing SUSE Manager {#introducing-suse-manager}

SUSE Manager lets you efficiently manage large sets of Linux systems and keep them up to date. It provides automated and cost-effective software management, asset management, and system provisioning. SUSE Manager provides a best in class solution for organizations requiring absolute control of maintenance and package deployment on their servers. It allows customers the highest level of flexibility and power ensuring their servers remain secure while facilitating and advancing an organizations system life-cycle requirements.

Salt.  The inclusion of `Salt` in SUSE Manager 3 provides powerful event-driven configuration and management capabilities for fine grained control of any modern infrastructure.

Salt-master.  SUSE Manager 3.1 takes a commanding role as a Salt-master capable of orchestrating thousands of Salt-minions (SUSE Manager Clients) via remote execution.

Distribution Management.  SUSE Manager 3.1 is also fully compatible with Red Hat Satellite Server and offers seamless management of both SUSE Linux Enterprise and Red Hat Enterprise Linux client systems.



## Overview {#overview}

SUSE Manager may be integrated within your network infrastructure in multiple ways. In this guide you will perform the following steps for an initial test setup.

*   Install SLES12 and SUSE Manager as an extension

*   Register SUSE Manager server with SCC (SUSE Customer Center)

*   Synchronize a repository channel for use with both traditional clients and salt-minions

*   Create an authentication key to act as an ID for the synced repository channel

*   Add the new authentication key to a bootstrap template script and connect a traditional client

*   Register a salt-minion with SUSE Manager (salt-master) and assign it a channel with an authentication key