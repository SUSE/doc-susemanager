## Visualization {#visualization}

_All images in this section are placeholders from the wiki until we can create a test setup with Fennek. These images are outdated and need to be replaced before release!!_

As of SUSE Manager 3.1 you can visualize your virtualized, proxy, and system group topologies. Listed under Systems+Visualization you will find the Virtualization Hierarchy, Proxy Hierarchy, and System Grouping subpages. This features allows you to search, filter and partition systems by name, base channel, check-in date, group, etc.

To visualize your systems select Systems+Visualization from the left navigation menu.

Click the Toggle Filters button to open the filters panel. Systems are filterable by properties such as name, base channel, installed products, etc.

| ![](systems_visualization_filter_example.png) |
| --- |

Systems may also be partitioned by checkin time. Select the check-in date and time and click the Apply button. The Reset button will revert current partition coniguration.

| ![](systems_visualization_partition_example.png) |
| --- |

All elements of the network tree are selectable. Clicking any element in the tree opens a box containing information about the selected systems and will be displayed in the top-right of the visualization area.

| ![](systems_visualization_selections_example.png) |
| --- |

Systems shown in the visualization view may be added to System Set Manager (SSM) for futher management. This can be performed in two ways:

*   Select single systems and click the Add system to SSM button in the top-right detail box.

*   Add all visible child elements of any parent node in the view (visible means when filters have been applied) by clicking the Add Children to SSM button at the bottom of the selection details panel.