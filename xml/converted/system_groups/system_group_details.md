### System Group Details {#system-group-details}

At the top of each System Group Details page are two links: Delete Group and Work With Group. Clicking Delete Group deletes the System Group and should be used with caution. Clicking Work With Group loads the group&#039;s systems and launches the System Set Manager immediately like the Use Group button from the System Groups list. Refer to [the section called “System Set Manager”](../system_set_manager/README.md) for more information.

The System Group Details page is split into the following tabs:

#### System Group Details &gt; Details {#system-group-details-details}

Provides the group name and group description. To change this information, click Edit These Properties, make your changes in the appropriate fields, and click the Update Group button.

#### System Group Details &gt; Systems {#system-group-details-systems}

Lists all members of the system group. Clicking links within the table takes you to corresponding tabs within the System Details page for the associated system. To remove systems from the group, select the appropriate check boxes and click the Remove Systems button on the bottom of the page. Clicking it does not delete systems from SUSE Manager entirely. This is done through the System Set Manager or System Details pages. Refer to [the section called “System Set Manager”](../system_set_manager/README.md) or [the section called “System Details”](../system_details/README.md), respectively.

#### System Group Details &gt; Target Systems {#system-group-details-target-systems}

Target Systems — Lists all systems in your organization. To add systems to the specified system group, click the check boxes to their left and click the Add Systems button on the bottom right-hand corner of the page.

#### System Group Details &gt; Patches {#system-group-details-patches}

List of relevant patches for systems in the system group. Clicking the advisory takes you to the Details tab of the Patch Details page. (Refer to

???

for more information.) Clicking the Affected Systems number lists all of the systems affected by the patch. To apply the patch updates in this list, select the systems and click the Apply Patches button.

#### System Group Details &gt; Admins {#system-group-details-admins}

List of all organization users that have permission to manage the system group. SUSE Manager Administrators are clearly identified. System Group Administrators are marked with an asterisk (*). To change the system group&#039;s users, select and deselect the appropriate check boxes and click the Update button.

#### System Group Details &gt; States [Salt] {#system-group-details-states-salt}

The States tab displays states which have been created and added using the Salt &gt; State Catalog. From this page you can select which states should be applied across a group of systems. A state applied from this page will be applied to all minions within a group.

### Note {#note}

States are applied according to the following order of hierarchy within SUSE Manager:

```
Organization > Group > Single System
```

Procedure 1.2. Applying States at the Group Level

1.  Create a state using the Salt+State Catalog or via the command line.

2.  Browse to Systems+System Groups. Select the group that a new state should be applied to. From a specific group page select the States tab.

3.  Use the search feature to located a state by name or click the Search button to list all available states.

4.  Select the check box for the state to be applied and click the Save button. The Save button will save the change to the database but will not apply the state.

5.  Apply the state by clicking the Apply button. The state will be scheduled and applied to any systems included within a group.