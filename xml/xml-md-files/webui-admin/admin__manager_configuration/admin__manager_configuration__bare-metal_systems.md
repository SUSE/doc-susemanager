### Admin &gt; Manager Configuration &gt; Bare-metal systems {#admin-manager-configuration-bare-metal-systems}

Here you can add unprovisioned (&quot;bare-metal&quot;) systems capable of booting using PXE to an organization.

| ![](admin_configuration_bare_metal_systems.png) |
| --- |

First click Enable adding to this organization. Those systems then will appear in the Systems list, where regular provisioning via autoinstallation is possible in a completely unattended fashion. Only AMD64/Intel 64 systems with at least 1 GB of RAM are supported. SUSE Manager server will use its integrated Cobbler instance and will act as TFTP server for this feature to work, so the network segment that connects it to target systems must be properly configured. In particular, a DHCP server must exist and have a next-server configuration parameter set to the SUSE Manager server IP address or hostname.

When enabled, any bare-metal system connected to the SUSE Manager server network will be automatically added to the organization when it powers on. The process typically takes a few minutes; when it finishes, the system will automatically shut down and then appear in the Systems list.

### Note {#note}

New systems will be added to the organization of the administrator who enabled this feature. To change the organization, disable the feature, log in as an administrator of a different organization and enable it again.

Provisioning can be initiated by clicking the Provisioning tab. In case of bare-metal systems, though, provisioning cannot be scheduled, it will happen automatically when it is completely configured and the system is powered on.

It is possible to use System Set Manager with bare-metal systems, although in that case some features will not be available as those systems do not have an operating system installed. This limitation also applies to mixed sets with regular and bare-metal systems: full features will be enabled again when all bare-metal systems are removed from the set.