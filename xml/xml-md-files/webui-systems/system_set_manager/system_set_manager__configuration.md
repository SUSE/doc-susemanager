### System Set Manager &gt; Configuration {#system-set-manager-configuration}

Like in the System Details+Channels+Configuration tab, the subtabs here can be used to subscribe the selected systems to configuration channels and deploy and compare the configuration files on the systems. The channels are created in the Manage Config Channels interface within the Channels category. Refer to

???

for channel creation instructions.

To manage the configuration of a system, install the latest `rhncfg*` packages. Refer to

???

for instructions on enabling and disabling scheduled actions for a system.

#### System Set Manager &gt; Configuration &gt; Deploy Files {#system-set-manager-configuration-deploy-files}

Use this subtab to distribute configuration files from your central repository on SUSE Manager to each of the selected systems.

| ![](systems_ssm_config_deploy_files.png) |
| --- |

The table lists the configuration files associated with any of the selected systems. Clicking its system count displays the systems already subscribed to the file.

To subscribe the selected systems to the available configuration files, select the check box for each wanted file. When done, click Deploy Configuration and schedule the action. Note that the latest versions of the files, at the time of scheduling, are deployed. Newer versions created after scheduling are disregarded.

#### System Set Manager &gt; Configuration &gt; Compare Files {#system-set-manager-configuration-compare-files}

Use this subtab to validate configuration files on the selected systems against copies in your central repository on SUSE Manager.

| ![](systems_ssm_config_compare_files.png) |
| --- |

The table lists the configuration files associated with any of the selected systems. Clicking a file&#039;s system count displays the systems already subscribed to the file.

To compare the configuration files deployed on the systems with those in SUSE Manager, select the check box for each file to be validated. Then click Analyze Differences+Schedule File Comparison. The comparisons for each system will not complete until each system checks in to SUSE Manager. When each comparison is complete, any differences between the files will be accessible from each system&#039;s events page.

Note that the latest versions of the files, at the time of scheduling, are compared. Newer versions created after scheduling are disregarded. Find the results in the main Schedule category or within the System Details+Events tab.

#### System Set Manager &gt; Configuration &gt; Subscribe to Channels {#system-set-manager-configuration-subscribe-to-channels}

Subscribe systems to configuration channels, and in a second step rank these channels according to the order of preference. This tab is available only to SUSE Manager Administrators and Configuration Administrators.

| ![](systems_ssm_config_subscribe_to_channels.png) |
| --- |

1.  Select channels for subscription by activating the check box. When done, confirm with Continue.

2.  In the second step, rank the channels with the arrow-up or arrow-down symbols.

    Then decide how the channels are applied to the selected systems. The three buttons below the channels reflect your options. Clicking Subscribe with Highest Priority places all the ranked channels before any other channels to which the selected systems are currently subscribed. Clicking Subscribe With Lowest Priority places the ranked channels after those channels to which the selected systems are currently subscribed. Clicking Replace Existing Subscriptions removes any existing association and creates new ones with the ranked channels, leaving every system with the same configuration channels in the same order.

    ### Confliction Ranks {#confliction-ranks}

    In the first two cases, if any of the newly ranked configuration channels are already in a system&#039;s existing configuration channel list, the duplicate channel is removed and replaced according to the new rank, effectively reordering the system&#039;s existing channels. When such conflicts exist, you are presented with a confirmation page to ensure the intended action is correct. When the change has taken place, a message appears at the top of the page indicating the update was successful.

    Then, click Apply Subscriptions.

Channels are accessed in the order of their rank. Your local configuration channel always overrides all other channels.

#### System Set Manager &gt; Configuration &gt; Unsubscribe from Channels {#system-set-manager-configuration-unsubscribe-from-channels}

Administrators may unsubscribe systems from configuration channels by clicking the check box next to the channel name and clicking the Unsubscribe Systems button.

| ![](systems_ssm_config_unsubscribe_from_channels.png) |
| --- |

#### System Set Manager &gt; Configuration &gt; Enable Configuration {#system-set-manager-configuration-enable-configuration}

Registered systems without configuration management preparation will appear here in a list.

Figure 1.3. Enable Configuration![Enable Configuration](systems_ssm_config_enable_config.png)

Administrators may enable configuration management by clicking the Enable SUSE Manager Configuration Management button. You can also schedule the action by adjusting the Schedule no sooner than date and time setting using the drop-down box, then clicking Enable SUSE Manager Configuration Management.

Then the systems will get subscribed to the required SUSE Manager tools channel and required rhncfg* packages will get installed.