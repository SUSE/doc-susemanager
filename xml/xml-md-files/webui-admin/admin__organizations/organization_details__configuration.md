### Organization Details &gt; Configuration {#organization-details-configuration}

Here you enable the Organization Administrator to manage Organization configuration, configure the organization to use staged contents (“pre-fetching” packages, etc.), set up software crash reporting, and upload of SCAP files.

| ![](admin_organization_configuration.png) |
| --- |

*   SUSE Manager Configuration
*   Enable Allow Organization Admin to manage Organization Configuration if wanted.

*   Organization Configuration
*   *   Enable Staging Contents

    *   Enable Errata E-mail Notifications (for users belonging to this organization)

    *   Enable Software Crash Reporting

    *   Enable Upload Of Crash Files

    *   Crash File Upload Size Limit

    *   Enable Upload Of Detailed SCAP Files

    *   SCAP File Upload Size Limit

    *   Allow Deletion of SCAP Results

    *   Allow Deletion After (period in days)

When settings are done, confirm with clicking the Update Organization button.

Enable Staging Contents.  The clients will download packages in advance and stage them. This has the advantage that the package installation action will take place immediately, when the schedule is actually executed. This “pre-fetching” saves maintenance window time, which is good for service uptime.

For staging contents (“pre-fetching”), edit on the client `/etc/sysconfig/rhn/up2date`:

```
stagingContent=1
stagingContentWindow=24
```

`stagingContentWindow` is a time value expressed in hours and determines when downloading will start. It is the number of hours before the scheduled installation or update time. In this case, it means `24` hours before the installation time. The exact download start time depends on the contact method—when the next **rhn_check** is performed.

Next time an action is scheduled, packages will automatically be downloaded but not installed yet. When the scheduled time comes, the action will use the staged version.

Minion Content Staging.  Every Organization administrator can enable Content Staging from the Organization configuration page Admin+Organization+OrgName+Configuration+Enable Staging Contents. Prior to SUSE Manager 3.1, this option was read-only by traditional clients for staging content (packages and patches) before an installation, to help reduce the time required for installing and updating packages and patches. Beginning with SUSE Manager 3.1, Enable Staging Contents also targets Salt minions for the selected Organization.

Staging content for minions is affected by two parameters.

*   `salt_content_staging_advance:` expresses the advance time, in hours, for the content staging window to open with regard to the scheduled installation/upgrade time.

*   `salt_content_staging_window:` expresses the duration, in hours, of the time window for Salt minions to stage packages in advance of scheduled installations or upgrades.

A value of **salt_content_staging_advance** equal to **salt_content_staging_window** results in the content staging window closing exactly when the installation/upgrade is scheduled to be executed, a larger value allows separating the download time from the installation time.

These options are configured in `/usr/share/rhn/config-defaults/rhn_java.conf` and by default assume the following values:

*   `salt_content_staging_advance: 8 hours`

*   `salt_content_staging_window: 8 hours`

### Note {#note}

These parameters will only have an effect when Content Staging is enabled for the targeted Organization.