### Configuring Slave Servers {#configuring-slave-servers}

Slave servers receive content synchronized from the master server.

| ![](admin_iss_configuration_slave.png) |
| --- |

To securely transfer content to the slave servers, the ORG-SSL certificate from the master server is needed. Click Admin+ISS Configuration+Slave Setup. In the top right-hand corner, click Add New Master:

| ![](admin_iss_configuration_edit_master.png) |
| --- |

and fill in the following information:

*   Master Fully Qualified Domain Name (FQDN)

*   Default Master?

*   Filename of this Master&#039;s CA Certificate: use the full path to the CA Certificate. For example:

    ```
     /etc/pki/trust/anchors
    ```

Click Add New Master.

Once the master and slave servers are configured, start the synchronization on the Master server by executing **mgr-inter-sync**:

```
mgr-inter-sync -c YOUR-CHANNEL
```