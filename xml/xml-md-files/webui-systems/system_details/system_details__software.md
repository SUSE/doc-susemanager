### System Details &gt; Software {#system-details-software}

This tab and its subtabs allow you to manage the software on the system: patches (errata), packages and package profiles, software channel memberships, and migrations.

#### System Details &gt; Software &gt; Patches {#system-details-software-patches}

This subtab contains a list of patch (errata) alerts applicable to the system. Refer to

???

for meanings of the icons on this tab.

| ![](system_details_traditional_software_patches.png) |
| --- |

To apply updates, select them and click the Apply Patches button. Double-check the updates to be applied on the confirmation page, then click the Confirm button. The action is added to the Pending Actions list under Schedule. Patches that have been scheduled cannot be selected for update. Instead of a check box there is a clock icon. Click the clock to see the Action Details page.

A Status column in the patches table shows whether an update has been scheduled. Possible values are: None, Pending, Picked Up, Completed, and Failed. This column displays only the latest action related to a patch. For example, if an action fails and you reschedule it, this column shows the status of the patch as `Pending` with no mention of the previous failure. Clicking a status other than `None` takes you to the Action Details page. This column corresponds to the one on the Affected Systems tab of the Patch Details page.

#### System Details &gt; Software &gt; Packages {#system-details-software-packages}

Manage the software packages on the system. Most of the following actions can also be performed via action chains. For further information on action chains, refer to

???

.

| ![](system_details_traditional_software_packages.png) |
| --- |

### Warning {#warning}

When new packages or updates are installed on the client via SUSE Manager, any licenses (EULAs) requiring agreement before installation are automatically accepted.

*   Packages
*   The default display of the Packages tab describes the options available and provides the means to update your package list. To update or complete a potentially outdated list, possibly because of the manual installation of packages, click the Update Package List button in the bottom right-hand corner of this page. The next time the SUSE Manager daemon (`rhnsd`) connects to SUSE Manager, it updates your system profile with the latest list of installed packages.

*   List / Remove
*   Lists installed packages and enables you to remove them. View and sort packages by name or the date they were installed on the system. Search for the wanted packages by typing its name in the Filter by Package Name text box, or by clicking the letter or number corresponding to the first character of the package name. Click a package name to view its Package Details page. To delete packages from the system, select their check boxes and click the Remove Packages button on the bottom right-hand corner of the page. A confirmation page appears with the packages listed. Click the Confirm button to remove the packages.

*   Upgrade
*   Displays a list of packages with newer versions available in the subscribed channels. click the latest package name to view its Package Details page. To upgrade packages immediately, select them and click the Upgrade Packages button. Any EULAs will be accepted automatically.

*   Install
*   Install new packages on the system from the available channels. Click the package name to view its Package Details page. To install packages, select them and click the Install Selected Packages button. EULAs are automatically accepted.

*   Verify
*   Validates the packages installed on the system against its RPM database. This is the equivalent of running **rpm -V**. The metadata of the system&#039;s packages are compared with information from the database, such as file checksum, file size, permissions, owner, group and type. To verify a package or packages, select them, click the Verify Selected Packages button, and confirm. When the check is finished, select this action in the History subtab under Events to see the results.

*   Lock
*   Locking a package prevents modifications like removal or update of the package. Since locking and unlocking happens via scheduling requests, locking might take effect with some delay. If an update happens before then, the lock will have no effect. Select the packages you want to lock. If locking should happen later, select the date and time above the Request Lock button, then click it. A small lock icon marks locked packages. To unlock, select the package and click Request Unlock, optionally specifying the date and time for unlocking to take effect.

    ### Note {#note}

    This feature only works if Zypper is used as the package manager. On the target machine the **zypp-plugin-spacewalk** package must be installed (version 0.9.x or higher).

*   Profiles
*   Compare installed packages with the package lists in stored profiles and other systems. Select a stored profile from the drop-down box and click the Compare button. To compare with packages installed on a different system, select the system from the associated drop-down box and click the Compare button. To create a stored profile based on the existing system, click the Create System Profile button, enter any additional information you want, and click the Create Profile button. These profiles are kept within the Stored Profiles page linked from the left bar.

    When installed packages have been compared with a profile, customers have the option to synchronize the selected system with the profile. All changes apply to the system not the profile. Packages might get deleted and additional packages installed on the system. To install only specific packages, click the respective check boxes in the profile. To remove specific packages installed on the system, select the check boxes of these packages showing a difference of This System Only. To completely synchronize the system&#039;s packages with the compared profile, select the master check box at the top of the column. Then click the Sync Packages to button. On the confirmation screen, review the changes, select a time frame for the action, and click the Schedule Sync button.

    You can use a stored profile as a template for the files to be installed on an autoinstalled system; see

    ???

    .

*   Non Compliant
*   Lists packages that are installed on this system and are not present in any of its channels.

#### System Details &gt; Software &gt; Software Channels {#system-details-software-software-channels}

Software channels provide a well-defined method to determine which packages should be available to a system for installation or upgrade based on its operating systems, installed packages, and functionality.

| ![](system_details_traditional_software_system_channels.png) |
| --- |

Click a channel name to view its Channel Details page. To modify the child channels associated with this system, use the check boxes next to the channels and click the Change Subscriptions button. You will receive a success message or be notified of any errors. In case of Salt minions, do not forget applying the high state; for more information, see [the section called “ System Details &gt; States &gt; Highstate ”](system_details__states_[_salt_].md#system-details-states-highstate).

To change the system&#039;s base channel, select the new one from the drop-down box and confirm.

For more information about channel management, see

???

.

#### System Details &gt; Software &gt; SP Migration {#system-details-software-sp-migration}

Service Pack Migration (SP Migration) allows you to upgrade a system from one service pack to another.

| ![](system_details_traditional_software_sp_migration.png) |
| --- |

### Warning {#warning-0}

During migration SUSE Manager automatically accepts any required licenses (EULAs) before installation.

Beginning with SLE 12 SUSE supports service pack skipping, it is now possible to migrate from for example, SLE 12 to SLE 12 SP2\. Note that SLE 11 may only be migrated step by step and individual service packs should not be skipped. Supported migrations include any of the following:

*   SLE 11 &gt; SLE 11 SP1 &gt; SLE 11 SP2 &gt; SLE 11 SP3 &gt; SLE 11 SP4

*   SLE 12 &gt; SLE 12 SP1 &gt; SLE 12 SP2

*   SLE 12 &gt; SLE 12 SP2 (skipping SLE 12 SP1)

### Migrating from an Earlier Version of SLES {#migrating-from-an-earlier-version-of-sles}

It is not possible to migrate, for example, from SLE 11 to SLE 12 using this tool. You must use autoYaST to perform a migration on this level.

### Rollback Not Possible {#rollback-not-possible}

The migration feature does not cover any rollback functionality. When the migration procedure is started, rolling back is not possible. Therefore it is recommended to have a working system backup available for an emergency.

Procedure 1.1. Performing a Migration

1.  From the Systems Overview page, select a client.

2.  Select the Software tab then the SP Migration tab.

3.  Select your target migration path and click Select Channels.

4.  On the Service Pack Migration - Channels view select the correct base channel, including `Mandatory Child Channels` and any additional `Optional Child Channels`. Select Schedule Migration when your channels have been configured properly.