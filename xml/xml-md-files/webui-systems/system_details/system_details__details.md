### System Details &gt; Details {#system-details-details}

This page is not accessible from any of the left bar. However, clicking the name of a system anywhere in the Web interface displays such a System Details page. By default, the Details+Overview subtab is displayed. Other tabs are available, depending on the system type and add-on system type. For example Traditional systems (Management, [Figure 1.1, “System Details Overview (Traditional Client)”](#fig.system-details.details.overview.trad)) and Salt systems (Salt, [Figure 1.2, “System Details Overview (Salt Minion)”](#fig.system-details.details.overview.salt)) display differerent tabs.

Figure 1.1. System Details Overview (Traditional Client)

| ![System Details Overview (Traditional Client)](system_details_traditional_overview.png) |
| --- |

Figure 1.2. System Details Overview (Salt Minion)

| ![System Details Overview (Salt Minion)](system_details_salt_overview.png) |
| --- |

#### System Details &gt; Details &gt; Overview {#system-details-details-overview}

This system summary page displays the system status message and the following key information about the system:

System Status

*   
*   This message indicates the current state of your system in relation to SUSE Manager.

    ### Note {#note}

    If updates are available for any entitled system, the message Software Updates Available appears, displaying the number of critical and non-critical updates and the sum of affected packages. To apply these updates, click Packages and select some or all packages to update, then click Upgrade Packages.

System Info

*   Hostname
*   The host name as defined by the client system.

*   IP Address
*   The IP address of the client.

*   IPv6 Address
*   The IPv6 address of the client.

*   Virtualization
*   If the client is a virtual machine, the type of virtualization is listed.

*   UUID
*   Displays the universally unique identifier.

*   Kernel
*   The kernel installed and operating on the client system.

*   SUSE Manager System ID
*   A unique identifier generated each time a system registers with SUSE Manager.

    ### Note {#note-0}

    The system ID can be used to eliminate duplicate profiles from SUSE Manager. Compare the system ID listed on this page with the information stored on the client system in the `/etc/sysconfig/rhn/systemid` file. In that file, the system&#039;s current ID is listed under `system_id`. The value starts after the characters `ID-`. If the value stored in the file does not match the value listed in the profile, the profile is not the most recent one and may be removed.

*   Activation Key
*   Displays the activation key used to register the system.

*   Installed Products
*   Lists the products installed on the system.

*   Lock Status
*   Indicates whether a system has been locked.

    Actions cannot be scheduled for locked systems on the Web interface until the lock is removed manually. This does not include preventing automated patch updates scheduled via the Web interface. To prevent the application of automated patch updates, deselect Auto Patch Update from the System Details+Details+Properties subtab. For more information, refer to [the section called “ System Details &gt; Details &gt; Properties ”](#system-details-details-properties).

    Locking a system can prevent you from accidentally changing a system. For example, the system may be a production system that should not receive updates or new packages until you decide to unlock it.

    ### Important {#important}

    Locking a system in the Web interface _will not_ prevent any actions that originate from the client system. For example, if a user logs in to the client directly and runs YaST Online Update (on SLE) or **pup** (on RHEL), the update tool will install available patches even if the system is locked in the Web interface.

    Locking a system _does not_ restrict the number of users who can access the system via the Web interface. If you want to restrict access to the system, associate that system with a System Group and assign a System Group Administrator to it. Refer to [the section called “System Groups”](../system_groups/README.md) for more information about System Groups.

    It is also possible to lock multiple systems via the System Set Manager. Refer to [the section called “ System Set Manager &gt; Misc &gt; Lock/Unlock ”](../system_set_manager/system_set_manager__misc.md#system-set-manager-misc-lock-unlock) for instructions.

Subscribed Channels

*   
*   List of subscribed channels. Clicking a channel name takes you to the Basic Channel Details page. To change subscriptions, click the (Alter Channel Subscriptions) link right beside the title to assign available base and child channels to this system. When finished making selections, click the Change Subscriptions button to change subscriptions and the base software channel. For more information, refer to [the section called “ System Details &gt; Software &gt; Software Channels ”](system_details__software.md#system-details-software-software-channels).

*   Base Channel
*   The first line indicates the base channel to which this system is subscribed. The base channel should match the operating system of the client.

*   Child Channels
*   The subsequent lines of text, which depend on the base channel, list child channels. An example is the SUSE Manager Tools channel.

System Events

*   Checked In
*   The date and time at which the system last checked in with SUSE Manager.

*   Registered
*   The date and time at which the system registered with SUSE Manager and created this profile.

*   Last Booted
*   The date and time at which the system was last started or restarted.

    ### Note {#note-1}

    Systems with Salt or Management entitlement can be rebooted from this screen.

    1.  Select Schedule system reboot.

    2.  Provide the earliest date and time at which the reboot may take place.

    3.  Click the Schedule Reboot button in the lower right.

    When the client checks in after the scheduled start time, SUSE Manager will instruct the system to restart itself.

System Properties

*   System Types
*   Lists system types and add-on types currently applied to the system.

*   Notifications
*   Indicates the notification options for this system. You can activate whether you want to receive e-mail notifying you of available updates for this system. In addition, you may activate to include systems in the daily summary e-mail.

*   Contact Method
*   Available methods: Default (Pull), Push via SSH, and Push via SSH tunnel.

    The so-called OSA status is also displayed for client systems registered with SUSE Manager that have the OSA dispatcher (osad) configured.

    Push enables SUSE Manager customers to immediately initiate tasks rather than wait for those systems to check in with SUSE Manager. Scheduling actions through push is identical to the process of scheduling any other action, except that the task can immediately be carried out instead of waiting the set interval for the system to check in.

    In addition to the configuration of SUSE Manager, to receive pushed actions each client system must have the `osad` package installed and its service started.

*   Auto Patch Update
*   Indicates whether this system is configured to accept updates automatically.

*   System Name
*   By default, the host name of the client is displayed, but a different system name can be assigned.

*   Description
*   This information is automatically generated at registration. You can edit the description to include any information you want.

*   Location
*   This field displays the physical address of the system if specified.

Clicking the Edit These Properties link right beside the System Properties title opens the System Details+Properties subtab. On this page, edit any text you choose, then click the Update Properties button to confirm.

#### System Details &gt; Details &gt; Properties {#system-details-details-properties}

This subtab allows you to alter basic properties of the selected system.

| ![](system_details_traditional_edit.png) |
| --- |

System Details

*   System Name
*   By default, this is the host name of the system. You can however alter the profile name to anything that allows you to distinguish this system from others.

*   Base System Type
*   For information only.

*   Add-on System Types
*   Select one of the available system types such as Virtualization.

*   Notifications
*   Select whether notifications about this system should be sent and whether to include this system in the daily summary. This setting keeps you aware of all advisories pertaining to the system. Anytime an update is released for the system, you receive an e-mail notification.

    The daily summary reports system events that affect packages, such as scheduled patch updates, system reboots, or failures to check in. In addition to including the system here, you must activate to receive e-mail notification in the Your Preferences page of the Overview category.

*   Contact Method
*   Select between Pull, Push via SSH, and Push via SSH tunnel.

*   Auto Patch Update
*   If this box is checked, available patches are automatically applied to the system when it checks in (Pull) or immediately if you select either Push option. This action takes place without user intervention. The SUSE Manager Daemon (`rhnsd`) must be enabled on the system for this feature to work.

    ### Conflicts With Third Party Packages {#conflicts-with-third-party-packages}

    Enabling auto-update might lead to failures because of conflicts between system updates and third party packages. To avoid failures caused by those issues, it is better to leave this box unchecked.

*   Description
*   By default, this text box records the operating system, release, and architecture of the system when it first registers. Edit this information to include anything you like.

The remaining fields record the physical address at which the system is stored. To confirm any changes to these fields, click the Update Properties button.

### Setting Properties for Multiple Systems {#setting-properties-for-multiple-systems}

Many of these properties can be set for multiple systems in one go via the System Set Manager interface. For details, see [the section called “System Set Manager”](../system_set_manager/README.md).

#### System Details &gt; Details &gt; Remote Command {#system-details-details-remote-command}

This subtab allows you to run remote commands on the selected system. Before doing so, you must first configure the system to accept such commands.

| ![](system_details_traditional_edit.png) |
| --- |

1.  On SLE clients, subscribe the system to the SUSE Manager Tools child channel. Then use Zypper to install the **rhncfg**, **rhncfg-client**, and **rhncfg-actions** packages, if not already installed:

    ```
    zypper in rhncfg rhncfg-client rhncfg-actions
    ```

    On RHEL clients, subscribe the system to the Tools child channel. Then use **up2date** or **yum** to install the **rhncfg**, **rhncfg-client**, and **rhncfg-actions** packages, if not already installed:

    ```
    yum install rhncfg rhncfg-client rhncfg-actions
    ```

2.  Log in to the system as root and add the following file to the local SUSE Manager configuration directory: `allowed-actions/scripts/run`.

    1.  Create the necessary directory on the target system:

        ```
        mkdir -p /etc/sysconfig/rhn/allowed-actions/script
        ```

    2.  Create an empty `run` file in that directory to act as a flag to SUSE Manager, signaling permission to allow remote commands:

        ```
        touch /etc/sysconfig/rhn/allowed-actions/script/run
        ```

When the setup is complete, refresh the page to view the text boxes for remote commands. Identify a specific user, group, and timeout period, and the script to run. Select a date and time to execute the command, then click Schedule or add the remote command to an action chain. For further information on action chains, refer to

???

.

#### System Details &gt; Details &gt; Reactivation [Management] {#system-details-details-reactivation-management}

Reactivation keys include this system&#039;s ID, history, groups, and channels. This key can then be used only once with the **rhnreg_ks** command line utility to re-register this system and regain all SUSE Manager settings. Unlike typical activation keys, which are not associated with a specific system ID, keys created here do not show up within the Activation Keys page.

| ![](system_details_reactivation.png) |
| --- |

Reactivation keys can be combined with activation keys to aggregate the settings of multiple keys for a single system profile. For example:

```
rhnreg_ks --server=server-url \
  --activationkey=reactivation-key,activationkey --force
```

### Warning {#warning}

When autoinstalling a system with its existing SUSE Manager profile, the profile uses the system-specific activation key created here to re-register the system and return its other SUSE Manager settings. For this reason, you should not regenerate, delete, or use this key (with **rhnreg_ks**) while a profile-based autoinstallation is in progress. If you do, the autoinstallation will fail.

#### System Details &gt; Details &gt; Hardware {#system-details-details-hardware}

This subtab provides information about the system, such as networking, BIOS, memory, and other devices. This only works if you included the hardware profile during registration. If the hardware profile looks incomplete or outdated, click the Schedule Hardware Refresh button. The next time the SUSE Manager Daemon (`rhnsd`) connects to SUSE Manager, it will update your system profile with the latest hardware information.

#### System Details &gt; Details &gt; Migrate {#system-details-details-migrate}

This subtab provides the option to migrate systems between organizations. Select an Organization Name and click Migrate System to initiate the migration.

| ![](system_details_traditional_migrate.png) |
| --- |

### Note {#note-2}

Defined system details such as channel assignments, system group membership, custom data value, configuration channels, reactivation keys, and snapshots will be dropped from the system configuration after the migration.

#### System Details &gt; Details &gt; Notes {#system-details-details-notes}

This subtab provides a place to create notes about the system. To add a new note, click the Create Note link, type a subject and write your note, then click the Create button. To modify a note, click its subject in the list of notes, make your changes, and click the Update button. To remove a note, click its subject in the list of notes then click the delete note link.

| ![](system_details_traditional_notes.png) |
| --- |

#### System Details &gt; Details &gt; Custom Info {#system-details-details-custom-info}

This subtab provides completely customizable information about the system. Unlike Notes, Custom Info is structured, formalized, and can be searched. Before you can provide custom information about a system, you must have Custom Information Keys. To create such keys, click Custom System Info in the left bar. For more information, see [the section called “Custom System Info”](../custom_system_info.md).

| ![](system_details_traditional_custom_info.png) |
| --- |

When you have created one or more keys, you may assign values for this system by selecting the Create Value link. Click the name of the key in the resulting list and enter a value for it in the Description field, then click the Update Key button.

#### System Details &gt; Details &gt; Proxy [Proxy] {#system-details-details-proxy-proxy}

This tab is only available for SUSE Manager Proxy systems. The tab lists all clients registered with the selected SUSE Manager Proxy server.