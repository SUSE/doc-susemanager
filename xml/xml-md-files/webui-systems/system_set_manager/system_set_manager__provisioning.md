### System Set Manager &gt; Provisioning {#system-set-manager-provisioning}

Set the options for provisioning systems via the following subtabs.

#### System Set Manager &gt; Provisioning &gt; Autoinstallation {#system-set-manager-provisioning-autoinstallation}

Use this subtab to reinstall clients.

| ![](systems_ssm_autoinstallation.png) |
| --- |

To schedule autoinstallations for these systems, select a distribution. The autoinstallation profile used for each system in the set is determined via the Autoinstallable Type radio buttons.

Choose Select autoinstallation profile to apply the same profile to all systems in the set. This is the default option. You will see a list of available profiles to select from when you click Continue.

Choose Autoinstall by IP Address to apply different autoinstallation profiles to different systems in the set, by IP address. To do so, at least two autoinstallation profiles must be configured with associated IP ranges.

If you use Autoinstall by IP Address, SUSE Manager will automatically pick a profile for each system so that the system&#039;s IP address will be in one of the IP ranges specified in the profile itself. If such a profile cannot be found, SUSE Manager will look for an organization default profile and apply that instead. If no matching IP ranges nor organization default profiles can be found, no autoinstallation will be performed on the system. You will be notified on the next page if that happens.

To use Cobbler system records for autoinstallation, select Create PXE Installation Configuration. With PXE boot, you cannot only reinstall clients, but automatically install machines that do not have an operating system installed yet. SUSE Manager and its network must be properly configured to enable boot using PXE. For more information on Cobbler and Kickstart templates, refer to

???

.

### Note {#note}

If a system set contains bare-metal systems and installed clients, only features working for systems without an operating system installed will be available. Full features will be enabled again when all bare-metal systems are removed from the set.

If any of the systems connect to SUSE Manager via a proxy server, choose either the Preserve Existing Configuration radio button or the Use Proxy radio button. If you choose to autoinstall through a proxy server, select from the available proxies listed in the drop-down box beside the Use Proxy radio button. All of the selected systems will autoinstall via the selected proxy. Click the Schedule Autoinstall button to confirm your selections. When the autoinstallations for the selected systems are successfully scheduled, you will return to the System Set Manager page.

#### System Set Manager &gt; Provisioning &gt; Tag Systems {#system-set-manager-provisioning-tag-systems}

Use this subtab to add meaningful descriptions to the most recent snapshots of your selected systems.

| ![](systems_ssm_tag_systems.png) |
| --- |

To tag the most recent system snapshots, enter a descriptive term in the Tag name field and click the Tag Current Snapshots button.

#### System Set Manager &gt; Provisioning &gt; Rollback {#system-set-manager-provisioning-rollback}

Use this subtab to rollback selected Provisioning-entitled systems to previous snapshots marked with a tag.

| ![](systems_ssm_rollback.png) |
| --- |

Click the tag name, verify the systems to be reverted, and click the Rollback Systems button.

#### System Set Manager &gt; Provisioning &gt; Remote Command {#system-set-manager-provisioning-remote-command}

Use this subtab to issue remote commands on selected Provisioning-entitled systems.

| ![](systems_ssm_remote_command.png) |
| --- |

First create a `run` file on the client systems to allow this function to operate. Refer to [the section called “ System Details &gt; Details &gt; Remote Command ”](../system_details/system_details__details.md#system-details-details-remote-command) for instructions. Then identify a specific user, group, timeout period, and the script to run. Select a date and time to execute the command and click Schedule.

#### System Set Manager &gt; Provisioning &gt; Power Management Configuration {#system-set-manager-provisioning-power-management-configuration}

| ![](systems_ssm_power_management_config.png) |
| --- |

#### System Set Manager &gt; Provisioning &gt; Power Management Operation {#system-set-manager-provisioning-power-management-operation}

| ![](systems_ssm_power_management_operations.png) |
| --- |