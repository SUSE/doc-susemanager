### Mapping SUSE Manager Master Server Organizations to Slave Organizations {#mapping-suse-manager-master-server-organizations-to-slave-organizations}

A mapping between organizational names on the master SUSE Manager allows for channel access permissions being set on the master server and propagated when content is synchronized to a slave SUSE Manager. Not all organization and channel details need to be mapped for all slaves. SUSE Manager administrators can select which permissions and organizations can be synchronized by allowing or omitting mappings.

To complete the mapping, log in to the Slave SUSE Manager as administrator. Click Admin+ISS Configuration+Slave Setup and select a master SUSE Manager by clicking its name. Use the drop-down box to map the exported master organization name to a matching local organization in the slave SUSE Manager, then click Update Mapping.

On the command line, issue the synchronization command on each of the custom channels to obtain the correct trust structure and channel permissions:

```
mgr-inter-sync -c YOUR-CHANNEL
```