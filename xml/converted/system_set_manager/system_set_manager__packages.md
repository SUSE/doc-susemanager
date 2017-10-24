### System Set Manager &gt; Packages {#system-set-manager-packages}

Click the number in the Systems column to see the systems in the System Set Manager to which a package applies. Modify packages on the system via the following subtabs.

| ![](systems_ssm_packages_overview.png) |
| --- |

#### System Set Manager &gt; Packages &gt; Install {#system-set-manager-packages-install}

This list includes all channels to which systems in the set are subscribed. A package is only installed on a system if the system is subscribed to the channel providing the package.

| ![](systems_ssm_install.png) |
| --- |

Click the channel name and select the packages from the list. Then click the Install Packages button.

#### System Set Manager &gt; Packages &gt; Remove {#system-set-manager-packages-remove}

A list of all the packages installed on the selected systems that might be removed.

| ![](systems_ssm_remove.png) |
| --- |

Multiple versions appear if systems in the System Set Manager have more than one version installed. Select the packages to be deleted, then click the Remove Packages button.

#### System Set Manager &gt; Packages &gt; Upgrade {#system-set-manager-packages-upgrade}

A list of all the packages installed on the selected systems that might be upgraded.

| ![](systems_ssm_upgrade.png) |
| --- |

Systems must be subscribed to a channel providing the packages to be upgraded. If multiple versions of a package are available, note that your system will be upgraded to the latest version. Select the packages to be upgraded, then click the Upgrade Packages button.

#### System Set Manager &gt; Packages &gt; Verify {#system-set-manager-packages-verify}

A list of all installed packages whose contents, file checksum, and other details may be verified.

| ![](systems_ssm_verify.png) |
| --- |

At the next check in, the verify event issues the command **rpm --verify** for the specified package. If there are any discrepancies, they are displayed in the System Details page for each system.

Select the check box next to all packages to be verified, then click the Verify Packages button. On the next page, select a date and time for the verification, then click the Schedule Verifications button.