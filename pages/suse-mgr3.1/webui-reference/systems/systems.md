---
title: Systems
keywords: systems overview
sidebar: sumadoc-31_sidebar
permalink: systems.html
folder: suse-mgr3.1/webui-reference/systems
toc: true
---

## Overview {#overview}

The System Overview page provides a summary of your systems, including their status, number of associated patches (errata) and packages, and their so-called system type. Clicking the name of a system takes you to its System Details page. Refer to [the section called “System Details”](system_details/README.md) for more information.

Clicking View System Groups at the top of the Overview page takes you to a similar summary of your system groups. It identifies group status and displays the number of systems contained. Then, clicking the number of systems takes you to the Systems tab of the System Group Details page, while clicking the group name takes you to the Details tab for that system group. Refer to [the section called “System Group Details”](system_groups/system_group_details.md) for more information.

You can also click Use in SSM in the System Groups section to go directly to the System Set Manager. Refer to [the section called “System Set Manager”](system_set_manager/README.md) for more information.

## Systems {#systems}

The Systems page displays a list of all your registered systems. Several columns provide information for each system:

### System Columns

- **Select box:** Systems without a system type cannot be selected. To select systems, mark the appropriate check boxes. Selected systems are added to the System Set Manager, where actions can be carried out simultaneously on all systems in the set. Refer to [the section called “System Set Manager”](../system_set_manager/README.md) for details.

- **System:** The name of the system specified during registration. The default name is the host name of the system. Clicking the name of a system displays its System Details page. Refer to [the section called “System Details”](../system_details/README.md) for more information.
<br/>See also: [Systems Icons](#system-icons)

- **Updates:** Shows which type of update action is applicable to the system or confirms that the system is up-to-date. Some icons are linked to related tasks. For example, the standard Updates icon is linked to the Upgrade subtab of the packages list, while the Critical Updates icon links directly to the Software Patches page.<br/> See also: [Update Icons](#update-icons)

- **Patches:** Total number of patch alerts applicable to the system.

- **Packages:** Total number of package updates for the system, including packages related to patch alerts and newer versions of packages not related to patch alerts. For example, if a client system that has an earlier version of a package installed gets subscribed to the appropriate base channel (such as SUSE Linux Enterprise 12 SP2), that channel may have an updated version of the package. If so, the package appears in the list of available package updates.

- **Configs:** Total number of configuration files applicable to the system.

- **Base Channel:** The primary channel for the system based on its operating system. Refer to <span class="label label-info">??? Fix Link ???</span> for more information.

- **System Type:** Shows whether the system is managed and at what service level.

Links in the navigation bar below Systems enable you to select and view predefined sets of your systems. All of the options described above can be applied within these pages.

#### System Icons {#system-icons}

The `System` column presents icons that represent the relationship to a system type.

- {% include inline_image.html file="spacewalk-icon-virtual-host.svg" alt="Virtual Host Icon" max-width="20" %} **Virtual Host**

- {% include inline_image.html file="spacewalk-icon-virtual-guest.svg" alt="Virtual Guest Icon" max-width="20" %} **Virtual Guest**

- {% include inline_image.html file="fa-236-non-virtual-system.svg" alt="Non-Virtual System Icon" max-width="20" %} **Non-Virtual System**

- {% include inline_image.html file="spacewalk-icon-unprov-system.svg" alt="Unprovisioned System Icon" max-width="20" %} **Unprovisioned System**

#### Updates Icons {#update-icons}

The `Updates` column present icons that represent an update type.

- {% include inline_image.html file="fa-check-circle.svg" alt="Circle" max-width="20" %} **System is up-to-date**

- {% include inline_image.html file="fa-exclamation-circle.svg" alt="Exclamation Circle" max-width="20" %} **Critical patch (errata) available, update _strongly_ recommended**

- {% include inline_image.html file="fa-warning.svg" alt="Warning" max-width="26" %} **Updates available and recommended**

- {% include inline_image.html file="fa-question-circle.svg" alt="Question" max-width="28" %} **System not checking in properly (for 24 hours or more)**

- {% include inline_image.html file="fa-lock.svg" alt="Lock" max-width="30" %} **System is locked; actions prohibited**

- {% include inline_image.html file="fa-rocket.svg" alt="Rocket" max-width="26" %} **System is being deployed using AutoYaST or Kickstart**

- {% include inline_image.html file="fa-clock-o.svg" alt="Clock" max-width="30" %} **Updates have been scheduled**

- {% include inline_image.html file="fa-times-circle.svg" alt="Times" max-width="30" %} **System not entitled to any update service**


{% include important.html content="If SUSE Manager identifies package updates for the system, but the package updater (such as Red Hat Update Agent or YaST) responds with a message like &quot;Your system is fully updated&quot;, a conflict likely exists in the system&#039;s package profile or in the `up2date` configuration file. To resolve the conflict, either schedule a package list update or remove the packages from the package exceptions list. Refer to [the section called “System Details”](../system_details/README.md) for instructions." %}




