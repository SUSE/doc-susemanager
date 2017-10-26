### Admin &gt; Manager Configuration &gt; General {#admin-manager-configuration-general}

This page allows you to alter basic SUSE Manager administration settings.

| ![](admin_general_configuration.png) |
| --- |

*   Administrator Email Address
*   E-mail address of the SUSE Manager administrator.

*   SUSE Manager Hostname
*   Host name of the SUSE Manager server.

*   SUSE Manager Proxy Configuration
*   HTTP proxy, HTTP proxy username, HTTP proxy password, and Confirm HTTP proxy password.

    The HTTP proxy settings are for the communication with a SUSE Manager parent server, if there is any. The HTTP proxy should be of the form: `hostname:port`; the default port `8080` will be used if none is explicitly provided. HTTP proxy settings for client systems to connect to this SUSE Manager can be different, and will be configured separately, for example via [the section called “Admin &gt; Manager Configuration &gt; Bootstrap Script”](admin__manager_configuration__bootstrap_script.md).

*   RPM repository mount point
*   The directory where RPM packages are mirrored. By default: `/var/spacewalk`.

*   Default To SSL
*   For secure communication, use SSL.

When done, confirm with Update.