## Firewall Rules {#firewall-rules}

In a production environment SUSE Manager server and its clients should always utilize firewall rules. The following table provides an overview of required ports for use by SUSE Manager 3.1.

Traditional client systems connect to SUSE Manager via port 443. In addition, enabling push actions from SUSE Manager to client systems, requires inbound connections on port 5222\. If SUSE Manager will also push to a SUSE Manager proxy, you must allow inbound connections on port 5269.

Table 1.1. Required Ports on SUSE Manager Server

| Port | Direction | Reason |
| --- | --- | --- |
| 67 | Inbound | Required when configured as a DHCP server for systems requesting IP addresses. |
| 69 | Inbound | Used when configured as a PXE server and allows installation and re-installation of PXE-boot enabled systems. |
| 80 | Outbound | Used to contact SUSE Customer Center. |
| 443 | Inbound | All Web UI, traditional client, and proxy server requests and SUSE Manager uses this port for SUSE Customer Center inbound traffic. |
| 4505 | Inbound | Required by the Salt-master to accept communication requests via TCP from minions. |
| 4506 | Inbound | Required by the Salt-master to accept communication requests via TCP from minions. |
| 5222 | Inbound | When you wish to push actions to clients this port is required by the `osad` daemon running on the client systems. |
| 5269 | Inbound/Outbound | Needed if you push actions to or via a SUSE Manager Proxy. |
|  | Outbound | Squid HTTP proxy for outgoing connections. It could be any port you configure. |