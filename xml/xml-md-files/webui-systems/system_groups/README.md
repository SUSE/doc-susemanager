## System Groups {#system-groups}

The System Groups page allows SUSE Manager users to view the System Groups list.

| ![](systems_systemgroups.png) |
| --- |

Only System Group Administrators and SUSE Manager Administrators may perform the following additional tasks:

2.  Create system groups. (Refer to [the section called “Creating Groups”](creating_groups.md).)

3.  Add systems to system groups. (Refer to [the section called “Adding and Removing Systems in Groups”](adding_and_removing_systems_in_groups.md).)

4.  Remove systems from system groups. (Refer to [the section called “System Details”](../system_details/README.md).)

5.  Assign system group permissions to users. (Refer to

    ???

    .)

The System Groups list displays all system groups. The list contains several columns for each group:

*   Select — Via the check boxes add all systems in the selected groups to the System Set Manager by clicking the Update button. All systems in the selected groups are added to the System Set Manager. You can then use the System Set Manager to perform actions on them simultaneously. It is possible to select only those systems that are members of all of the selected groups, excluding those systems that belong only to one or some of the selected groups. To do so, select the relevant groups and click the Work with Intersection button. To add all systems of all selected groups, click the Work with Union button. Each system will show up once, regardless of the number of groups to which it belongs. Refer to [the section called “System Set Manager”](../system_set_manager/README.md) for details.

*   Updates — Shows which type of patch alerts are applicable to the group or confirms that all systems are up-to-date. Clicking a group&#039;s status icon takes you to the Patch tab of its System Group Details page. Refer to [the section called “System Group Details”](system_group_details.md) for more information.

    The status icons call for differing degrees of attention:

    *   — All systems in the group are up-to-date.

    *   ![Exclamation Circle](fa-exclamation-circle.png) — Critical patches available, update _strongly_ recommended.

    *   ![Warning](fa-warning.png) — Updates available and recommended.

*   Health Status of the systems in the group, reported by probes.

*   Group Name — The name of the group as configured during its creation. The name should be explicit enough to distinguish from other groups. Clicking the name of a group takes you to the Details tab of its System Group Details page. Refer to [the section called “System Group Details”](system_group_details.md) for more information.

*   Systems — Total number of systems in the group. Clicking the number takes you to the Systems tab of the System Group Details page for the group. Refer to [the section called “System Group Details”](system_group_details.md) for more information.

*   Use in SSM — Clicking the Use in SSM link in this column loads all and only the systems in the selected group and launches the System Set Manager immediately. Refer to [the section called “System Set Manager”](../system_set_manager/README.md) for more information.