### System Details &gt; Virtualization {#system-details-virtualization}

This tab allows you to create a new virtual guest on a host system or change the status of virtual guests.

| ![](system_details_traditional_provisioning_snapshot_index.png) |
| --- |

The Virtualization tab has two subtabs, Details and Kickstart. These tabs appear the same for both virtual hosts and guests, but the functionality only makes sense for virtual hosts. It is not possible to create a guest system that runs on another guest system.

#### System Details &gt; Virtualization &gt; Details {#system-details-virtualization-details}

Details is the default tab. For host systems, it presents a table of the host system&#039;s virtual guests. For each guest system, the following information is provided:

*   Status
*   This field indicates whether the virtual system is running, paused, stopped, or has crashed.

*   Updates
*   This field indicates whether patches (errata) applicable to the guest have yet to be applied.

*   Base Software Channel
*   This field indicates the Base Channel to which the guest is subscribed.

### Note {#note}

If a guest system has not registered with SUSE Manager, this information appears as plain text in the table.

If you have System Group Administrator responsibilities assigned for your guest systems, a user might see the message You do not have permission to access this system in the table. This is because it is possible to assign virtual guests on a single host to multiple System Group Administrators. Only users that have System Group Administrator privileges on the host system may create new virtual guests.