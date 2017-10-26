### Using Multiple Activation Keys at Once {#using-multiple-activation-keys-at-once}

Multiple activation keys can be specified at the command line or in a single autoinstallation profile. This allows you to aggregate the aspects of various keys without re-creating a specific key for every system that you want to register, simplifying the registration and autoinstallation processes while slowing the growth of your key list. Separate keys with a comma at the command line with **rhnreg_ks** or in a Kickstart profile in the Activation Keys tab of the Autoinstallation Details page.

Registering with multiple activation keys requires some caution. Conflicts between some values cause registration to fail. Conflicts in the following values do not cause registration to fail, a combination of values is applied: software packages, software child channels, and configuration channels. Conflicts in the remaining properties are resolved in the following manner:

*   Base software channels: registration fails.

*   System types: registration fails.

*   Enable configuration flag: configuration management is set.

Do not use system-specific activation keys along with other activation keys; registration fails in this event.

You are now ready to use multiple activation keys at once.