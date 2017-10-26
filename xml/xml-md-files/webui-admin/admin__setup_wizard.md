## Admin &gt; Setup Wizard {#admin-setup-wizard}

Setting up SUSE Manager typically requires some extra steps after installation for common configuration tasks.

The Setup Wizard link is displayed when the SUSE Manager Web interface is used for the fist time and can be accessed later at any time by clicking Admin+Setup Wizard. On the three tabs configure the HTTP proxy server, organization credentials, and SUSE products.

*   HTTP Proxy:
*   Configure a proxy server that SUSE Manager will use to access SCC (SUSE Customer Center) and other remote servers here.

    | ![](admin_proxy_settings.png) |
    | --- |

    Use `hostname:port` syntax in the Hostname field if the proxy port is not 8080\. Clearing the fields disables proxy.

*   Organization Credentials:
*   Click Add a new credential and enter user name and password to allow a user to access SCC.

    | ![](admin_organization_credentials.png) |
    | --- |

    After saving, a new credential card will be displayed. Buttons below the credential card allow you to:

    *   see the credential validation status (green tick or red cross icon). To re-check the credential with SCC, click the icon;

    *   set the primary credentials for inter-server synchronization (yellow star icon);

    *   list the subscriptions related to a certain credential (list icon);

    *   edit the credential (pencil icon);

    *   delete the credential (trash can icon).

*   SUSE Products:
*   On the SUSE Products page, select product-specific channels you are entitled to.

    | ![](admin_suse_products.png) |
    | --- |

    The products displayed are directly linked to your organization credentials and your SUSE subscriptions. Product extentions and modules are shown when you select the corresponding base product or click the plus sign to its left. After you have made your selection, click Add products. This equals running **mgr-sync add products** or **mgr-sync** without any argument.

    ### Synchronization Time {#synchronization-time}

    Channel synchronization will start and might take several hours. When finished the corresponding channels can be used in SUSE Manager.

    ### If Synchronization Fails {#if-synchronization-fails}

    SUSE does not automatically trust 3rd party GPG keys. Should a reposync fail you can detect if an untrusted GPG key is the root cause by viewing log files located in:

    ```
    /var/log/rhn/reposync
    ```

    Look for lines similar to the following:

    ```
    ['/usr/bin/spacewalk-repo-sync', '--channel', 'sle-12-sp1-ga-desktop-
          nvidia-driver-x86_64', '--type', 'yum', '--non-interactive']
        ChannelException: The GPG key for this repository is not part of
          the keyring.
        Please run spacewalk-repo-sync in interactive mode to import it.
    ```

    Alternatively, you can add listed channels right away by clicking the Add this product button in the status column. A progress bar will be displayed. The main product will expand, and now you can select add-on products belonging to the product that is currently added. To check for required channels, click the list icon in the Channels column. When a product is downloaded and ready to use, the state will change to Finished.