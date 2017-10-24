## Bootstrapping [Salt] {#bootstrapping-salt}

The Bootstrapp Minions page allows you to bootstrap Salt minions from the Web UI.

Figure 1.4. Bootstrapping

| ![Bootstrapping](bootstrapping.png) |
| --- |

Bootstrapping Parameters

*   Host
*   Place the FQDN of the minion to be bootstrapped within this field.

*   SSH Port
*   Place the SSH port that will be used to connect and bootstrap a machine. The default is `22`.

*   User
*   Input the minions user login. The default is `root`.

*   Password
*   Input the minions login password.

*   Activation Key
*   Select the activation key (associated with a software source channel) that the minion should use to bootstrap with.

*   Disable SSH Strict Key Host Checking
*   This check box is selected by default. This allows the script to auto-accept host keys without requiring a user to manually authenticate.

*   Manage System Completely via SSH (Will not Install an Agent)
*   ### Technology Preview {#technology-preview}

    This feature is a Technology preview.

    If selected a system will automatically be configured to use SSH. No other connection method will be configured.

Once your minion&#039;s connection details have been filled in click the Bootstrap button. When the minion has completed the bootstrap process, find your new minion listed on the Systems+Overview page.