### System Details &gt; States [Salt] {#system-details-states-salt}

Overview of States subtabs.

### Note {#note}

The following subtabs are only available for Salt minions.

#### System Details &gt; States &gt; Packages {#system-details-states-packages}

Search and install packages then assign them with a pre-defined state for a selected machine.

| ![](system_details_salt_states_packages.png) |
| --- |

Here you can search for a specific package, for example vim. Then with the drop-down box activate Unmanaged, Installed, or Removed. Select Latest or Any from the drop-down box. Latest applies the latest package version available while Any applies the package version required to fulfil dependencies. Click the Save button to save changes to the database, then click Apply to apply the new package state.

#### System Details &gt; States &gt; Custom {#system-details-states-custom}

States which have been created on the States Catalog page located under Salt on the left bar may be assigned to a system on the States+Custom page.

| ![](system_details_salt_states_custom.png) |
| --- |

Search for the custom state you want to apply to the system then select the Assign check box. Click Save to save the change to the database finally select Apply to apply the changes. States applied at the system level will only be applied to the selected system.

#### System Details &gt; States &gt; Highstate {#system-details-states-highstate}

From the Highstate page you can view and apply the high state for a selected system.

| ![](system_details_salt_states_highstate.png) |
| --- |

Select a date and time to apply the high state. Then click Apply Highstate.