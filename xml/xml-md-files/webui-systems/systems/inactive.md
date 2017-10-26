### Inactive {#inactive}

The Inactive Systems page displays systems that have not checked in with SUSE Manager for 24 hours or more.

| ![](systems_inactive.png) |
| --- |

Checking in means that Zypper on SUSE Linux Enterprise or Red Hat Update Agent on Red Hat Enterprise Linux client systems connects to SUSE Manager to see if there are any updates available or if any actions have been scheduled. If you see a message telling you that check-ins are not taking place, the client system is not successfully connecting to SUSE Manager. The reason may be one of the following:

*   The system is not entitled to any SUSE Manager service. System profiles that remain unentitled for 180 days (6 months) are removed.

*   The system is entitled, but the SUSE Manager daemon (`rhnsd`) has been disabled on the system. Refer to

    ???

    for instructions on restarting and troubleshooting.

*   The system is behind a firewall that does not allow connections over `https` (port 443).

*   The system is behind an HTTP proxy server that has not been properly configured.

*   The system is connected to a SUSE Manager Proxy Server or SUSE Manager that has not been properly configured.

*   The system itself has not been properly configured, perhaps pointing at the wrong SUSE Manager Server.

*   The system is not in the network.

*   Some other barrier exists between the system and the SUSE Manager Server.