### System Details &gt; Events {#system-details-events}

The Events page displays past, current, and scheduled actions on the system. You may cancel pending events here. The following sections describe the Events subtabs and the features they offer.

#### System Details &gt; Events &gt; Pending {#system-details-events-pending}

Lists events that are scheduled but have not started.

| ![](system_details_traditional_events_pending.png) |
| --- |

A prerequisite action must complete successfully before the given action is attempted. If an action has a prerequisite, no check box is available to cancel that action. Instead, a check box appears next to the prerequisite action; canceling the prerequisite action causes the action in question to fail.

Actions can be chained so that action &#039;a&#039; requires action &#039;b&#039; which requires action &#039;c&#039;. Action &#039;c&#039; is performed first and has a check box next to it until it is completed successfully. If any action in the chain fails, the remaining actions also fail. To unschedule a pending event, select the event and click the Cancel Events button at the bottom of the page. The following icons indicate the type of events:

| ![](spacewalk-icon-packages.png) — Package Event, |
| --- |
| ![](spacewalk-icon-patches.png) — Patch Event, |
| ![](fa-cog.png) — Preferences Event, |
| ![](fa-desktop.png) — System Event. |

#### System Details &gt; Events &gt; History {#system-details-events-history}

The default display of the Events tab lists the type and status of events that have failed, occurred or are occurring.

| ![](system_details_traditional_events_history.png) |
| --- |

To view details of an event, click its summary in the System History list. To go back to the table again, click Return to history list at the bottom of the page.