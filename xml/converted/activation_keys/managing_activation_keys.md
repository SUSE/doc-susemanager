### Managing Activation Keys {#managing-activation-keys}

From the Activation Key page organize activation keys for channel management.

| ![](systems_activation_keys.png) |
| --- |

To create an activation key:

Procedure 1.3. Creating Activation Keys

*   Select Systems+Activation Keys from the left bar.

    *   Click the Create Key link at the upper right corner.

    *   Description — Enter a Description to identify the generated activation key.

2.  Key — Either choose automatic generation by leaving this field blank or enter the key you want to generate in the Key field. This string of characters can then be used with **rhnreg_ks** to register client systems with SUSE Manager. Refer to [the section called “Using Multiple Activation Keys at Once”](using_multiple_activation_keys_at_once.md) for details.

    ### Allowed Characters {#allowed-characters}

    _2011-03-24 - ke: bwiedemann 20110210: # wirklich alle? auch &quot;&#039;\ und 0 bytes? Also see the quick starts! 2016-02-17 - moio: ,&quot; are not allowed &lt;&gt; (){} will get removed automatically _Do not insert commas or double quotes in the key. All other characters are allowed, but `&lt;&gt; (){}` (this includes the space) will get removed automatically. If the string is empty, a random one is generated.

    Commas are problematic because they are used as separator when two or more activation keys are used at once.

3.  Usage — The maximum number systems that can be registered with the activation key concurrently. Leave blank for unlimited use. Deleting a system profile reduces the usage count by one and registering a system profile with the key increases the usage count by one.

4.  Base Channels — The primary channel for the key. This can be either the `SUSE Manager Default` channel, a SUSE provided channel, or a custom base channel.

    Selecting `SUSE Manager Default` allows client systems to register with the SUSE-provided default channel that corresponds with their installed version of SUSE Linux Enterprise. You can also associate the key with a custom base channel. If a system using this key is not compatible with the selected channel, it will fall back to the SUSE Manager default channel.

5.  Add-on System Types — The supplemental system types for the key, e. g. Virtualization Host. All systems will receive these system types with the key.

6.  Contact Method - Select how clients communicate with SUSE Manager. Default (Pull) waits for the client to check in. With Push via SSH and Push via SSH tunnel the server contacts the client via SSH (with or without tunnel) and pushes updates and actions, etc.

    For more information about contact methods, see

    ???

    .

7.  Universal Default — Select whether this key should be considered the primary activation key for your organization.

    ### Changing the Default Activation Key {#changing-the-default-activation-key}

    Only one universal default activation key can be defined per organization. If a universal key already exists for this organization, you will unset the currently used universal key by activating the check box.

8.  Click Create Activation Key.

To create more activation keys, repeat the steps above.

After creating the unique key, it appears in the list of activation keys along with the number of times it has been used. Only Activation Key Administrators can see this list. At this point, you can configure the key further, for example, associate the key with child channels (for example, the Tools child channel), packages (for example, the rhncfg-actions package) and groups. Systems registered with the key get automatically subscribed to them.

To change the settings of a key, click the key&#039;s description in the list to display its Details page (see [Figure 1.5, “Activation Key Details With Subtabs”](#fig_s1_sm_systems_akey_details)). Via additional tabs you can select child channels, packages, configuration channels, group membership and view activated systems. Modify the appropriate tab then click the Update Activation Key button. To disassociate channels and groups from a key, deselect them in the respective menus by **Ctrl**-clicking their highlighted names. To remove a key entirely, click the Delete Key link in the upper right corner of the Details page. In the upper right corner find also the Clone Key link.

Figure 1.5. Activation Key Details With Subtabs

| ![Activation Key Details With Subtabs](systems_activation_key_details.png) |
| --- |

Any (client tools) package installation requires that the Client Tools channel is available and the Provisioning check box is selected. The Client Tools channel should be selected in the Child Channels tab.

After creating the activation key, you can see in the Details tab a check box named Configuration File Deployment. If you select it, all needed packages are automatically added to the Packages list. By default, the following packages are added: rhncfg, rhncfg-client, and rhncfg-actions.

If you select Virtualization Host you automatically get the following package: rhn-virtualization-host.

Adding the osad package makes sense to execute scheduled actions immediately after the schedule time. When the activation key is created, you can add packages with selecting the key (Software+Activation Keys), then on the activation key details tab, go for the Packages subtab and add osad.

To disable system activations with a key, uncheck the corresponding box in the Enabled column in the key list. The key can be re-enabled by selecting the check box. Click the Update Activation Keys button on the bottom right-hand corner of the page to apply your changes.