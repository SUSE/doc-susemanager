## Admin &gt; Task Schedules {#admin-task-schedules}

Under Task Schedules all predefined task bunches are listed.

| ![](admin_task_schedules.png) |
| --- |

Click a Schedule name to open its Basic Schedule Details where you disable it or change the frequency. Click Edit Schedule to update the schedule with your settings. To delete a schedule, click delete schedule in the upper right-hand corner.

### Warning {#warning}

Only disable or delete a schedule if you are absolutely certain this is necessary as they are essential for SUSE Manager to work properly.

If you click a bunch name, a list of runs of that bunch type and their status will be displayed. Clicking the start time links takes you back to the Basic Schedule Details.

For example, the following predefined task bunches are scheduled by default and can be configured:

*   channel-repodata-default:
*   (re)generates repository metadata files.

*   cleanup-data-default:
*   cleans up stale package change log and monitoring time series data from the database.

*   clear-taskologs-default:
*   clears task engine (taskomatic) history data older than a specified number of days, depending on the job type, from the database.

*   cobbler-sync-default:
*   synchronizes distribution and profile data from SUSE Manager to Cobbler. For more information on Cobbler, see

    ???

    .

*   compare-configs-default:
*   compares configuration files as stored in configuration channels with the files stored on all configuration-enabled servers. To review comparisons, click the Systems tab and click the system of interest. Go to Configuration+Compare Files. For more information, refer to

    ???

    .

*   cve-server-channels-default:
*   updates internal pre-computed CVE data that is used to display results on the CVE Audit page. Search results in the CVE Audit page are updated to the last run of this schedule). For more information, see

    ???

    .

*   daily-status-default:
*   sends daily report e-mails to relevant addresses. See

    ???

    to learn more about how to configure notifications for specific users.

*   errata-cache-default:
*   updates internal patch cache database tables, which are used to look up packages that need updates for each server. Also, this sends notification emails to users that might be interested in certain patches. For more information on patches, see

    ???

    .

*   errata-queue-default:
*   queues automatic updates (patches) for servers that are configured to receive them.

*   kickstart-cleanup-default:
*   cleans up stale kickstart session data.

*   kickstartfile-sync-default:
*   generates Cobbler files corresponding to Kickstart profiles created by the configuration wizard.

*   mgr-register-default:
*   calls the **mgr-register** command, which synchronizes client registration data with NCC (new, changed or deleted clients&#039; data are forwarded).

*   mgr-sync-refresh-default:
*   the default time at which the start of synchronization with SUSE Customer Center (SCC) takes place (`mgr-sync-refresh`).

*   package-cleanup-default:
*   deletes stale package files from the file system.

*   reboot-action-cleanup-default:
*   any reboot actions pending for more than six hours are marked as failed and associated data is cleaned up in the database. For more information on scheduling reboot actions, see

    ???

    .

*   sandbox-cleanup-default:
*   cleans up sandbox configuration files and channels that are older than the sandbox_lifetime configuration parameter (3 days by default). Sandbox files are those imported from systems or files under development. For more information, see

    ???

*   session-cleanup-default:
*   cleans up stale Web interface sessions, typically data that is temporarily stored when a user logs in and then closes the browser before logging out.

*   ssh-push-default:
*   prompts clients to check in with SUSE Manager via SSH if they are configured with a SSH Push contact method.