### Admin &gt; Manager Configuration &gt; Bootstrap Script {#admin-manager-configuration-bootstrap-script}

The Manager Configuration+Bootstrap Script page allows you to generate a bootstrap script that registers the client systems with SUSE Manager and disconnects them from the remote SUSE Customer Center.

| ![](admin_configuration_bootstrap.png) |
| --- |

This generated script will be placed within the `/srv/www/htdocs/pub/bootstrap/` directory on your SUSE Manager server. The bootstrap script will significantly reduce the effort involved in reconfiguring all systems, which by default obtains packages from the SUSE Customer Center. The required fields are pre-populated with values derived from previous installation steps. Ensure this information is accurate.

To bootstrap traditional clients, uncheck Bootstrap using Salt. For more information, see

???

.

Check boxes offer options for including built-in security SSL and GNU Privacy Guard (GPG) features, both of which are advised. In addition, you may enable remote command acceptance and remote configuration management of the systems to be bootstrapped to the SUSE Manager. Both features are useful for completing client configuration. Finally, if you are using an HTTP proxy server, fill in the related fields. When finished, click Update.