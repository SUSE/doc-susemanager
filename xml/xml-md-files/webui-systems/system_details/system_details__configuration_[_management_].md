### System Details &gt; Configuration [Management] {#system-details-configuration-management}

This tab and its subtabs assist in managing the configuration files associated with the system. These configuration files may be managed solely for the current system or distributed widely via a Configuration Channel. The following sections describe these and other available options on the System Details+Configuration subtabs.

### Note {#note}

To manage the configuration of a system, it must have the latest rhncfg* packages installed. Refer to

???

for instructions on enabling and disabling scheduled actions for a system.

This section is available to normal users with access to systems that have configuration management enabled. Like software channels, configuration channels store files to be installed on systems. While software updates are provided by SCC, configuration files are managed solely by you. Also unlike with software packages, various versions of configuration files may prove useful to a system at any time. Only the latest version can be deployed.

#### System Details &gt; Configuration &gt; Overview {#system-details-configuration-overview}

This subtab provides access to the configuration files of your system and to the most common tasks used to manage configuration files.

| ![](system_details_traditional_configuration_overview.png) |
| --- |

In the Configuration Overview, click the Add links to add files, directories, or symbolic links. Here you also find shortcuts to perform any of the common configuration management tasks listed on the right of the screen by clicking one of the links under Configuration Actions.

_emap 2014-04-22: much has changed here, but I&#039;ve got no system with configuration files available, so I&#039;m going by the descriptions in the web-ui._

_ke 2016-11-09: checked. updated where appropriate, but I did not mention every detail. Check bug 1009102 and 1009118, when resolved; maybe, button texts will change!_

#### System Details &gt; Configuration &gt; View/Modify Files {#system-details-configuration-view-modify-files}

This subtab lists all configuration files currently associated with the system. These are sorted via subtabs in centrally and locally managed files and a local sandbox for files under development.

Using the appropriate buttons on a subtab, you can copy from one to the other subtabs.

*   Centrally-Managed Files
*   | ![](system_details_traditional_configuration_view_mod_central_paths.png) |
    | --- |

    Centrally-managed configuration files are provided by global configuration channels. Determine which channel provides which file by examining the Provided By column below. Some of these centrally-managed files may be overridden by locally-managed files. Check the Overridden By column to find out if any files are overridden, or click Override this file to provide such an overriding file.

*   Locally-Managed Files
*   | ![](system_details_traditional_configuration_view_mod_local_paths.png) |
    | --- |

    Locally-managed configuration files are useful for overriding centrally-managed configuration profiles that cause problems on particular systems. Also, locally-managed configuration files are a method by which system group administrators who do not have configuration administration privileges can manage configuration files on the machines they can manage.

*   Local Sandbox
*   | ![](system_details_traditional_configuration_view_mod_sandbox_paths.png) |
    | --- |

    In the sandbox you can store configuration files under development. You can promote files from the sandbox to a centrally-managed configuration channel using Copy Latest to Central Channel. After files in this sandbox have been promoted to a centrally-managed configuration channel, you can deploy them to other systems.

    Use Copy Latest to System Channel to install a configuration on the local system only. When done, the file will end up on the Locally-Managed Files subtab.

#### System Details &gt; Configuration &gt; Add Files {#system-details-configuration-add-files}

To upload, import, or create new configuration files, click Add Files.

*   Upload File
*   | ![](system_details_traditional_configuration_add_files_upload.png) |
    | --- |

    To upload a configuration file from your local machine, browse for the upload file, specify whether it is a text or binary file, enter Filename/Path and user and group ownership. Specific file permissions can be set. When done, click Upload Configuration File.

*   Import Files
*   | ![](system_details_traditional_configuration_add_files_import.png) |
    | --- |

    Via the Import Files tab, you can add files from the system you have selected before and add it to the sandbox of this system. Files will be imported the next time **rhn_check** runs on the system. To deploy these files or override configuration files in global channels, copy this file into your local override channel after the import has occurred.

    In the text box under Import New Files enter the full path of any files you want import into SUSE Manager or select deployable configuration files from the Import Existing Files list. When done, click Import Configuration Files.

*   Create File
*   | ![](system_details_traditional_configuration_add_files_create.png) |
    | --- |

    Under Create File, you can directly create the configuration file from scratch. Select the file type, specify the path and file name, where to store the file, plus the symbolic link target file name and path. Ownership and permissions and macro delimiters need to be set. For more information on using macros, see

    ???

    . In the File Contents text box, type the configuration file. Select the type of file you are creating from the drop-down box. Possible choices are Shell, Perl, Python, Ruby and XML. When done, click Create Configuration File.

#### System Details &gt; Configuration &gt; Deploy Files {#system-details-configuration-deploy-files}

Under Deploy Files you find all files that can be deployed on the selected system.

| ![](system_details_traditional_configuration_deploy_file.png) |
| --- |

Files from configuration channels with a higher priority take precedence over files from configuration channels with a lower priority. _emap 2014-04-22: can&#039;t see if the rest is still accurate or has changed._

#### System Details &gt; Configuration &gt; Compare Files {#system-details-configuration-compare-files}

_emap 2014-04-22: Still accurate?_ This subtab compares a configuration file stored on the SUSE Manager with the file stored on the client. (It does not compare versions of the same file stored in different channels.)

| ![](system_details_traditional_configuration_diff_file.png) |
| --- |

Select the files to be compared, click the Compare Files button, select a time to perform the diff, and click the Schedule Compare button to confirm.

To watch progress, see [the section called “ System Details &gt; Events ”](system_details__events.md). After the diff has been performed, go to Recent Events in [the section called “ System Details &gt; Configuration &gt; Overview ”](#system-details-configuration-overview) to see the results.

#### System Details &gt; Configuration &gt; Manage Configuration Channels {#system-details-configuration-manage-configuration-channels}

This subtab allows you to subscribe to and rank configuration channels associated with the system, lowest first.

| ![](system_details_traditional_configuration_config_channel_list.png) |
| --- |

The List/Unsubscribe from Channels subtab contains a list of the system&#039;s configuration channel subscriptions. Click the check box next to the Channel and click Unsubscribe to remove the subscription to the channel.

The Subscribe to Channels subtab lists all available configuration channels. To subscribe to a channel, select the check box next to it and click Continue. To subscribe to all configuration channels, click Select All and click Continue. The View/Modify Rankings page automatically loads.

The View/Modify Rankings subtab allows users to set the priority with which files from a particular configuration channel are ranked. The higher the channel is on the list, the more its files take precedence over files on lower-ranked channels. For example, the higher-ranked channel may have an `httpd.conf` file that will take precedence over the same file in a lower-ranked channel.