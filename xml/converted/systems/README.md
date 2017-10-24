## Systems {#systems}

The Systems page displays a list of all your registered systems. Several columns provide information for each system:

*   Select box: Systems without a system type cannot be selected. To select systems, mark the appropriate check boxes. Selected systems are added to the System Set Manager, where actions can be carried out simultaneously on all systems in the set. Refer to [the section called “System Set Manager”](../system_set_manager/README.md) for details.

*   System: The name of the system specified during registration. The default name is the host name of the system. Clicking the name of a system displays its System Details page. Refer to [the section called “System Details”](../system_details/README.md) for more information.

    | ![Virtual Host](spacewalk-icon-virtual-host.png) — Virtual Host. |
    | --- |
    | ![Virtual Guest](spacewalk-icon-virtual-guest.png) — Virtual Guest. |
    | ![Non-Virtual System](fa-236-non-virtual-system.png) — Non-Virtual System. |
    | ![Unprovisioned System](spacewalk-icon-unprov-system.png) — Unprovisioned System. |

*   Updates: Shows which type of update action is applicable to the system or confirms that the system is up-to-date. Some icons are linked to related tasks. For example, the standard Updates icon is linked to the Upgrade subtab of the packages list, while the Critical Updates icon links directly to the Software Patches page.

    | ![Check Circle](fa-check-circle.png) — System is up-to-date. |
    | --- |
    | ![Exclamation Circle](fa-exclamation-circle.png) — Critical patch (errata) available, update _strongly_ recommended. |
    | ![Warning](fa-warning.png) — Updates available and recommended. |
    | ![Question](fa-question-circle.png) — System not checking in properly (for 24 hours or more). |
    | ![Lock](fa-lock.png) — System is locked; actions prohibited. |
    | ![Rocket](fa-rocket.png) — System is being deployed using AutoYaST or Kickstart. |
    | ![Clock](fa-clock-o.png) — Updates have been scheduled. |
    | ![Times](fa-times-circle.png) — System not entitled to any update service. |

*   Patches: Total number of patch alerts applicable to the system.

*   Packages: Total number of package updates for the system, including packages related to patch alerts and newer versions of packages not related to patch alerts. For example, if a client system that has an earlier version of a package installed gets subscribed to the appropriate base channel (such as SUSE Linux Enterprise 12 SP2), that channel may have an updated version of the package. If so, the package appears in the list of available package updates.

    ### Package Conflict {#package-conflict}

    If SUSE Manager identifies package updates for the system, but the package updater (such as Red Hat Update Agent or YaST) responds with a message like &quot;Your system is fully updated&quot;, a conflict likely exists in the system&#039;s package profile or in the `up2date` configuration file. To resolve the conflict, either schedule a package list update or remove the packages from the package exceptions list. Refer to [the section called “System Details”](../system_details/README.md) for instructions.

*   Configs: Total number of configuration files applicable to the system.

*   Base Channel: The primary channel for the system based on its operating system. Refer to

    ???

    for more information.

*   System Type: Shows whether the system is managed and at what service level.

Links in the navigation bar below Systems enable you to select and view predefined sets of your systems. All of the options described above can be applied within these pages.