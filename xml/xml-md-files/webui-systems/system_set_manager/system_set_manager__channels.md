### System Set Manager &gt; Channels {#system-set-manager-channels}

Manage channel associations through the following subtabs:

#### System Set Manager &gt; Channels &gt; Base Channels {#system-set-manager-channels-base-channels}

As a Channel Administrator, you may change the base channels your systems are subscribed to.

| ![](systems_ssm_base_channels.png) |
| --- |

Valid channels are either channels created by your organization, or the vendor&#039;s default base channel for your operating system version and processor type. Systems will be unsubscribed from all channels, and subscribed to their new base channels.

### Changing Base Channel {#changing-base-channel}

This operation can have a dramatic effect on the packages and patches available to the systems. Use with caution.

To change the base channel, select the new one from the Desired base Channel and confirm the action.

#### System Set Manager &gt; Channels &gt; Child Channels {#system-set-manager-channels-child-channels}

The Child Channels tab allows you to subscribe and unsubscribe individual child channels related to its parent or base channel.

| ![](systems_ssm_child_subscriptions.png) |
| --- |

To subscribe or unsubscribe selected systems to any of the channels, toggle the appropriate check boxes and click the Alter Subscriptions button. Keep in mind that subscribing to a channel uses a channel entitlement for each system in the selected group. If too few entitlements are available, some systems fail to subscribe. Systems must subscribe to a base channel before subscribing to a child channel.