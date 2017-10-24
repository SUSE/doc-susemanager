## Additional Requirements {#additional-requirements}

To successfully complete this guide some network requirements must be met. The following section will walk you through these requirements.

Fully Qualified Domain Name (FQDN):  The SUSE Manager server must resolve its FQDN correctly or cookies will not work properly on the Web UI. For more information on FQDN, see:

*   [https://www.suse.com/documentation/sles-12/book_sle_admin/data/sec_basicnet_yast.html#sec_basicnet_yast_change_host](https://www.suse.com/documentation/sles-12/book_sle_admin/data/sec_basicnet_yast.html#sec_basicnet_yast_change_host)

Hostname and IP Address:  To ensure that SUSE Manager&#039;s domain name can be resolved by its clients, both server and client machines must be connected to a working Domain Name System (DNS) server. This guide assumes the required infrastructure exists within your environment. For more information on setting up a (DNS) server, see:

Using a Proxy When Installing from SUSE Linux Enterprise Media.  If you are on an internal network and do not have access to SUSE Customer Center, you can setup and use a proxy during a SUSE Linux Enterprise installation. For more information on configuring a proxy for access to SUSE Customer Center during a SUSE Linux Enterprise installation see:[https://www.suse.com/documentation/sled-12/singlehtml/book_sle_deployment/book_sle_deployment.html#sec.i.yast2.start.parameters.proxy](https://www.suse.com/documentation/sled-12/singlehtml/book_sle_deployment/book_sle_deployment.html#sec.i.yast2.start.parameters.proxy)

*   [https://www.suse.com/documentation/sles-12/book_sle_admin/data/cha_dns.html](https://www.suse.com/documentation/sles-12/book_sle_admin/data/cha_dns.html)

### Naming Your Server {#naming-your-server}

The hostname of SUSE Manager must not contain uppercase letters as this may cause `jabberd` to fail. Choose the hostname of your SUSE Manager server carefully. Although changing the server name is possible, it is a complex process and unsupported.

For a more complete overview on SUSE Manager requirements not covered in this guide, see

???

.