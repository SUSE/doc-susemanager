### Configuring the Master SUSE Manager Server {#configuring-the-master-suse-manager-server}

The following will help you set up a master ISS server.

| ![](admin_iss_configuration_master.png) |
| --- |

Click Admin+&gt;ISS Configuration+Master Setup. In the top right-hand corner of this page, click Add New Slave:

| ![](admin_iss_configuration_edit_slave.png) |
| --- |

and fill in the following information:

*   Slave Fully Qualified Domain Name (FQDN)

*   Allow Slave to Sync? — Choosing this field will allow the slave SUSE Manager to access this master SUSE Manager. Otherwise, contact with this slave will be denied.

*   Sync All Orgs to Slave? — Checking this field will synchronize all organizations to the slave SUSE Manager.

### Note {#note}

Choosing the Sync All Orgs to Slave? option on the Master Setup page will override any specifically selected organizations in the local organization table.

Click Create. Optionally, click any local organization to be exported to the slave SUSE Manager then click Allow Orgs.

### Enabling Inter-server Synchronization {#enabling-inter-server-synchronization}

ISS is enabled by default in SUSE Manager 3.1 and later. The following configuration change applies only to SUSE Manager 2.1 and earlier. To enable the inter-server synchronization (ISS) feature, edit the `/etc/rhn/rhn.conf` file and set: **disable_iss=0**. Save the file and restart the httpd service with **service httpd restart**.

For synchronization timeout settings, see

???

.