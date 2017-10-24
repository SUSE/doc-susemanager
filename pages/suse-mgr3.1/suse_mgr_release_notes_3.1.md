---
title: SUSE Manager Release Notes 3.1
tags: [getting_started]
keywords: release notes, announcements, what's new, new features, changelog
last_updated: June 27, 2017
summary: "SUSE Manager 3.1 release notes. Latest features and changes"
sidebar: sumadoc_sidebar
permalink: suse_mgr_release_notes3.1.html
folder: suse-mgr3.1
---

# Release notes for SUSE Manager 3.1 Server

<font size="4">_Version 3.1.2_</font>
<font size="4">Friday September 22, 2017</font></center>


This SUSE product includes materials licensed to SUSE under the GNU General Public License (GPL). The GPL requires that SUSE makes available certain source code that corresponds to the GPL-licensed material. The source code is available for download at [http://www.suse.com/download-linux/source-code.html](http://www.suse.com/download-linux/source-code.html).

Also, for up to three years from SUSE's distribution of the SUSE product, upon request SUSE will mail a copy of the source code. Requests should be sent by e-mail to [sle_source_request@suse.com](mailto:sle_source_request@suse.com) or as otherwise instructed at [http://www.suse.com/download-linux/source-code.html](http://www.suse.com/download-linux/source-code.html). SUSE may charge a fee to recover its reasonable costs of distribution.

<a name="toc1"></a>

## Version Revision History

*   January 9th, 2017: Alpha1 release
*   February 10th, 2017: Alpha2 release
*   March 10th, 2017: Beta1 release
*   April 6th, 2017: Beta2 release
*   May 8th, 2017: Beta3 release
*   Jun 1st, 2017: RC1 release
*   Jun 27th, 2017: GA release
*   August 25th, 2017: 3.1.1
*   September 2017: 3.1.2

<a name="toc2"></a>

# About SUSE Manager

You have more than just a few Linux servers to manage, maybe even a mixed environment of RHEL and SLES?

Then SUSE Manager is the answer.

SUSE Manager gives you best-in-class open source infrastructure management with new enhancements focused on improving DevOps efficiency, with both RHEL and SLES support from one unified console, maintained and improved by the guys who wrote the fastest and most advanced Linux update stack on the planet.

SUSE Manager gives you the lowest possible Total Cost of Ownership for your Linux environment, from bare metal provisioning to daily patch management. SUSE Manager is an open source (GPLv2) Linux systems management solution that allows you to:

*   Inventory your systems (hardware and software information)
*   Install and update software on your systems
*   Collect and distribute your custom software packages into manageable groups
*   Provision (AutoYaST / Kickstart) your systems
*   Easily manage configurations with Salt
*   Match subscriptions to products installed on your servers
*   Provision and start/stop/configure virtual guests
*   Distribute content across multiple geographical sites in an efficient manner
*   Find vulnerable systems by searching by CVE number
*   Track compliance of managed systems with OpenSCAP
*   Improve DevOps efficiency and optimize operations with a single tool to setup and manage your container infrastructure
*   Ensure container and cloud VM compliance to hardened profiles/templates across your DevOps environments based on your own internal security policies
*   Reduce complexity and regain control of your assets with improved visibility of your systems and infrastructure deployments

<a name="toc3"></a>

## Stay up-to-date

You can stay up-to-date regarding information about SUSE Manager and SUSE products:

*   Check the [SUSE Manager Wiki](http://wiki.novell.com/index.php/SUSE_Manager)
*   Read the [SUSE Blog](https://www.suse.com/communities/conversations/category/suse-manager/)

<a name="toc4"></a>

# Installation

<a name="toc5"></a>

## Requirements

SUSE Manager 3.1 Server is an extension for SLES 12 SP3 for x86-64 or z Systems (s390x).

This means that installation is done in two steps

*   base operating system (SLES 12 SP3)
*   SUSE Manager 3.1 Server extension

This addresses the need of enterprise deployments to standardize on the base operating system as well as specific storage setups.

It is strongly recommended to use SUSE Manager with the embedded database. PostgreSQL is only supported as a local (embedded) database.

<a name="toc6"></a>

## Registration code

The SUSE Manager 3.1 Server registration code, matching your hardware architecture, can be used to register the SLES 12 SP3 base system as well.

<a name="toc7"></a>

## Installing the SUSE Manager 3.1 Server extension on SLES 12 SP3

You'll need a physical or virtual SLES 12 SP3 x86_64 or s390x system to install SUSE Manager 3.1 Server.

When you install and register SLES 12 SP3, SUSE Manager 3.1 Server will show up in the list of available extensions.

You'll need a valid SUSE Manager 3.1 Server registration code to access this extension.

<a name="toc8"></a>

## Update from previous versions of SUSE Manager Server

You can update from SUSE Manager 3.0 Server to SUSE Manager 3.1 Server.

Updates from older versions are not supported.

The actual upgrade can be done as a two-step or a one-step approach.

The two-step approach migrates the SUSE Manager 3.0 Server to SLES 12 SP2 first, followed by an update to SUSE Manager 3.1 Server.

The one-step approach migrates the SUSE Manager 3.0 Server to SUSE Manager 3.1 Server together with the service pack migration of the base system from SLES 12 SP1 to SLES 12 SP2.

Note: SUSE Manager 3.0 Server is not yet enabled for SLES 12 SP3\. The respective update will be released in October 2017.

See the best practices manual for detailed instructions on how to upgrade.

All connected clients will continue to run and are manageable unchanged.

<a name="toc9"></a>

## Migrating from RHN Satellite

Is conditionally supported with SUSE Manager 3.1 Server.

If you have the need to migrate from RHN Satellite to SUSE Manager 3.1 Server, please get in contact with a SUSE sales engineer or a SUSE consultant before starting the migration.

<a name="toc10"></a>

# Major changes since SUSE Manager Server 3.1 GA

<a name="toc11"></a>

## Features and changes

<a name="toc12"></a>

### Version 3.1.2

<a name="toc13"></a>

#### PostgreSQL 9.6 support

A new version of the PostgreSQL database is available in SLES 12 SP2 and can be used for SUSE Manager 3.1 Server.

New installations of SUSE Manager 3.1 Server based on SLES 12 SP3 will automatically pick up this version.

<a name="toc14"></a>

##### Migrating from PostgreSQL 9.4 to PostgreSQL 9.6

**Note**: SUSE Manager 3.1 Server must **NOT** be migrated to SLES 12 SP3 before migrating PostgreSQL to version 9.6.

The migration needs PostgreSQL 9.4 and 9.6 installed in parallel and PostgreSQL 9.4 is only available in SLES 12 SP2

You should have an up-to-date database backup before attempting the migration.

Existing installations of SUSE Manager 3.1 Server will need to run

<pre>      /usr/lib/susemanager/bin/pg-migrate.sh
</pre>

to migrate from PostgreSQL 9.4 to PostgreSQL 9.6

Your SUSE Manager Server installation will not be accessible during the migration.

Migration will create a copy of the database under `/var/lib/pgsql` and thus needs sufficient disk space to hold two copies (9.4 and 9.6) of the database.

Since it does a full copy of the database, it also needs considerable time depending on the size of the database and the IO speed of the storage.

If your system is scarce on disk space you can do an fast, in-place migration by running

<pre>      /usr/lib/susemanager/bin/pg-migrate.sh fast
</pre>

The fast migration usually only takes minutes and no additional disk space. However, in case of failure you need to restore the database from a backup.

[This wiki page](https://wiki.microfocus.com/index.php/SUSE_Manager/postgresql96) contains additional information about the migration.

<a name="toc15"></a>

#### SUSE Manager Server enabled for SLES 12 SP3

SUSE Manager 3.1 is now based on SLES 12 SP3.

If you already have a SUSE Manager 3.1 Server or Proxy deployed, you can now initiate a service pack migration as outlined in the [SLES documentation](https://www.suse.com/documentation/sles-12/book_sle_deployment/data/cha_update_spmigration.html).

Please migrate to PostgreSQL 9.6 as outlined above before starting the service pack migration.

If you deploy a SUSE Manager 3.1 Server or Proxy anew, please start with SLES 12 SP3 as the base operating system.

Release notes and documentation have been adapted to reflect this.

<a name="toc16"></a>

#### Channel changes on minions

This update brings an important change in semantics when changing channel assignments on minions.

In the past, channel assignment changes were executed immediately, without respecting config change time slots. Effectively doing a 'change of client configuration outside of a maintenance window'.

This is fixed with 3.1.2 by delaying state application until

*   a package installation or upgrade is executed
*   a patch installation is executed
*   a service pack migration is executed
*   the state is explicitly applied via the web UI
*   the state is explicitly applied via the command line

A respective web UI information is also shown for the client.

<a name="toc17"></a>

#### SUSE CaaS Platform / Kubernetes integration

This update brings the initial integration of SUSE Manager with the [SUSE CaaS Platform](https://www.suse.com/products/caas-platform)

You can now search containers running on the SUSE CaaS Platform for

*   known vulnerabilities
*   outstanding patches
*   pending package updates

The SUSE CaaS Platform / Kubernetes infrastructure data can also be visualized via the `Systems` > `Visualization` page.

<a name="toc18"></a>

#### Container inspection / Image import

Inspection of containers build by SUSE Manager was already part of the 3.1 release.

Now you can also import and inspect any 'foreign' container image available in the configured container registry.

This feature is currently limited to SLES-based containers. The container needs to have `Python` installed.

<a name="toc19"></a>

### Version 3.1.1

Bugfix release

<a name="toc20"></a>

#### New products supported

*   SUSE Enterprise Storage 5
*   SUSE OpenStack Cloud Continuous Delivery 6

<a name="toc21"></a>

## Patches

The [SUSE Patch Finder](https://download.suse.com/patch/finder) is a simple online service to view released patches.

<a name="toc22"></a>

### Version 3.1.2

<a name="toc23"></a>

#### Client tools

spacecmd:

*   Switched logging from warning to debug.

spacewalk-backend:

*   Fix SP migration for traditional clients which were registered by a currently disabled user. ([bsc#1057126](http://bugzilla.suse.com/show_bug.cgi?id=1057126))
*   Increase rpclib timeout to 10 minutes. ([bsc#1026930](http://bugzilla.suse.com/show_bug.cgi?id=1026930))

supportutils-plugin-salt:

*   Prevent supportconfig from getting stuck when minions are unreachable. ([bsc#1048694](http://bugzilla.suse.com/show_bug.cgi?id=1048694))

<a name="toc24"></a>

#### Salt

The following security issue has been fixed:

*   CVE-2017-12791: Directory traversal vulnerability in minion id validation allowed remote minions with incorrect credentials to authenticate to a master via a crafted minion ID ([bsc#1053955](http://bugzilla.suse.com/show_bug.cgi?id=1053955)).

Additionally, the following non-security issues have been fixed:

*   Added support for SUSE Manager scalability features. ([bsc#1052264](http://bugzilla.suse.com/show_bug.cgi?id=1052264))
*   Introduced the kubernetes module. ([bsc#1051948](http://bugzilla.suse.com/show_bug.cgi?id=1051948))
*   Notify systemd synchronously via NOTIFY_SOCKET. ([bsc#1053376](http://bugzilla.suse.com/show_bug.cgi?id=1053376))

<a name="toc25"></a>

#### Server

salt-netapi-client:

*   Xor gson type adapter is now generic in its left type.
*   Fixed problems with payload encoding.
*   Support for setting returned information for install an listPkg calls.
*   Support for rand_thin_dir in salt ssh configuration.

smdba:

*   Ensure cleanup of existing too low value for default_statistics_target. ([bsc#1022286](http://bugzilla.suse.com/show_bug.cgi?id=1022286))

spacecmd:

*   Switched logging from warning to debug.

spacewalk:

*   Support PostgreSQL 9.6\. ([bsc#1045152](http://bugzilla.suse.com/show_bug.cgi?id=1045152))

spacewalk-backend:

*   Fix SP migration for traditional clients which were registered by a currently disabled user. ([bsc#1057126](http://bugzilla.suse.com/show_bug.cgi?id=1057126))
*   Increase rpclib timeout to 10 minutes. ([bsc#1026930](http://bugzilla.suse.com/show_bug.cgi?id=1026930))

spacewalk-branding:

*   Fixes ise error with invalid custom key id. ([bsc#1048294](http://bugzilla.suse.com/show_bug.cgi?id=1048294))
*   Add message about channel changes on salt managed systems to UI and API documentation. ([bsc#1048845](http://bugzilla.suse.com/show_bug.cgi?id=1048845))
*   Visualization UI look & feel improvements.
*   Add missing translations.
*   Fix ace_editor textarea width.

spacewalk-config:

*   Resolve comps.xml file for repositories. ([bsc#1048528](http://bugzilla.suse.com/show_bug.cgi?id=1048528))

spacewalk-doc-indexes:

*   Update index files.

spacewalk-java:

*   Only unselect element if it is selectable. ([bsc#1052373](http://bugzilla.suse.com/show_bug.cgi?id=1052373))
*   Adapt Salt runner and wheel calls to the new error handling introduced in salt-netapi-client-0.12.0.
*   Change log level and event history for duplicate machine id. ([bsc#1041489](http://bugzilla.suse.com/show_bug.cgi?id=1041489))
*   Trim spaces around the target expression in the Salt remote command page. ([bsc#1056678](http://bugzilla.suse.com/show_bug.cgi?id=1056678))
*   Check entitlement usage based on grains when onboarding a minion. ([bsc#1043880](http://bugzilla.suse.com/show_bug.cgi?id=1043880))
*   Fixes ise error with invalid custom key id. ([bsc#1048294](http://bugzilla.suse.com/show_bug.cgi?id=1048294))
*   Image runtime UI.
*   Redesign VHM pages on ReactJS.
*   Add VHM type Kubernetes.
*   Kubernetes runner and image matching implementation.
*   XMLRPC method for importing images.
*   Extra return data fields for content management XMLRPC methods.
*   Add back 'Add Selected to SSM' buttons to Group pages. ([bsc#1047702](http://bugzilla.suse.com/show_bug.cgi?id=1047702))
*   Fix a ConstraintViolationException when refreshing hardware with changed network interfaces or IP addresses.
*   Add message about channel changes on salt managed systems to UI and API documentation. ([bsc#1048845](http://bugzilla.suse.com/show_bug.cgi?id=1048845))
*   Show Child Channels tab in SSM again if a salt minion is in the set.
*   Improve performance of package installation and patch application.
*   Visualization UI loo & feel improvements.
*   Import image UI.
*   Update images list and overview pages for external images.
*   Add syntax highlighting for state catalog.
*   Delete and create new ServerNetAddress if it already exists on HW refresh. ([bsc#1054225](http://bugzilla.suse.com/show_bug.cgi?id=1054225))
*   Check if base product exists to prevent NPE.
*   Fix enter key submit on ListTag filter input. ([bsc#1048762](http://bugzilla.suse.com/show_bug.cgi?id=1048762))
*   Create VirtpollerData object with JSON content instead null. ([bsc#1049170](http://bugzilla.suse.com/show_bug.cgi?id=1049170))
*   Fix unsetting of image build host when a related action is deleted.
*   Prevent malformed XML if `arch` is set to NULL. ([bsc#1045575](http://bugzilla.suse.com/show_bug.cgi?id=1045575))
*   Resolve comps.xml file for repositories. ([bsc#1048528](http://bugzilla.suse.com/show_bug.cgi?id=1048528))
*   Fix address review issues.
*   Install update stack erratas as a package list. ([bsc#1049139](http://bugzilla.suse.com/show_bug.cgi?id=1049139))
*   Feat: Allow deletion for server subset. ([bsc#1051452](http://bugzilla.suse.com/show_bug.cgi?id=1051452))

spacewalk-web:

*   Image runtime UI.
*   Redesign VHM pages on ReactJS.
*   Dropdown button ReactJS component.
*   Use ModalButton component in subscription matching pages.
*   Visualization UI look & feel improvements.
*   Show a list of channels when an activation key is selected in image import form.
*   Improve error handling in image import UI.
*   Import image UI.
*   Update images list and overview pages for external images.
*   Remove the unused code that caused problems on some browsers. ([bsc#1050399](http://bugzilla.suse.com/show_bug.cgi?id=1050399))
*   Use ace editor for custom states with yaml syntax highlighting.
*   Fix enter key submit on ListTag filter input. ([bsc#1048762](http://bugzilla.suse.com/show_bug.cgi?id=1048762))

supportutils-plugin-salt:

*   Prevent supportconfig from getting stuck when minions are unreachable. ([bsc#1048694](http://bugzilla.suse.com/show_bug.cgi?id=1048694))

susemanager:

*   Fix migration from SUSE Manager versions > 2.1\. ([bsc#1055306](http://bugzilla.suse.com/show_bug.cgi?id=1055306))
*   Do not use checkpoint_segments parameter during migrations.

susemanager-docs_en:

*   General update for version 3.1.

susemanager-schema:

*   DB objects for Kubernetes integration.
*   Backend for importing images.
*   Fix unsetting of image build host when a related action is deleted.

susemanager-sls:

*   Kubernetes runner implementation.
*   Addition of parameters to package manipulation states to improve SUSE Manager performance.

susemanager-sync-data:

*   Add Proxy subchannels for SLES 12 SP3\. ([bsc#1053850](http://bugzilla.suse.com/show_bug.cgi?id=1053850))

virtual-host-gatherer:

*   Parameters to configure Kuberntes module from kubeconfig.
*   Implement kubernetes gatherer module.

python-websocket-client:

*   New package for kubernetes integration

<a name="toc26"></a>

### Version 3.1.1

jabberd:

*   Securtity update to version 2.6.1
*   Fixed offered SASL mechanism check ([bsc#1047282](http://bugzilla.suse.com/show_bug.cgi?id=1047282), [CVE-2017-10807](https://www.suse.com/de-de/security/cve/CVE-2017-10807))
*   Gracefully drop unhandled HTTP connections
*   wss:// (WebSocket over SSL) support in c2s
*   Removed explicit SQLite transactions
*   SQLite postconnect SQL support
*   SQLite DB setup script improvements
*   Reordered MIO backends priority
*   Support for RSA/DH/ECDH key agreement

osad:

*   Reduce maximal size of osad log before rotating
*   Perform osad restart in posttrans ([bsc#1039913](http://bugzilla.suse.com/show_bug.cgi?id=1039913))

salt-netapi-client:

*   Update to version 0.12.0

smdba:

*   Support postgresql96 ([bsc#1045152](http://bugzilla.suse.com/show_bug.cgi?id=1045152))

spacecmd:

*   Configchannel export binary flag to json ([bsc#729910](http://bugzilla.suse.com/show_bug.cgi?id=729910))

spacewalk-backend:

*   Make master_label static to keep its value when retrying ([bsc#1038321](http://bugzilla.suse.com/show_bug.cgi?id=1038321))
*   Adapt for the new gpgcheck flag for the channels

spacewalk-branding:

*   Fix overlapping of elem. ([bsc#1031143](http://bugzilla.suse.com/show_bug.cgi?id=1031143))
*   Fix overlapping text narrow window ([bsc#1009118](http://bugzilla.suse.com/show_bug.cgi?id=1009118))
*   Fix formulas action buttons position ([bsc#1047513](http://bugzilla.suse.com/show_bug.cgi?id=1047513))
*   Fix broken link ([bsc#1033999](http://bugzilla.suse.com/show_bug.cgi?id=1033999))
*   Alphabar: change title to 'Select first character' (bsc1042199)

spacewalk-certs-tools:

*   Improve text for bootstrap ([bsc#1032324](http://bugzilla.suse.com/show_bug.cgi?id=1032324))

spacewalk-java:

*   Fix: don't add default channel if AK is not valid ([bsc#1047656](http://bugzilla.suse.com/show_bug.cgi?id=1047656))
*   Add 'Enable GPG check' function for channels
*   No legend icon for Activity Ocurring. ([bsc#1051719](http://bugzilla.suse.com/show_bug.cgi?id=1051719))
*   Implement API call for bootstrapping systems
*   Fix product ids reported for SUSE Manager Server to the subscription matcher
*   Fix adding products when assigning channels ([bsc#1049664](http://bugzilla.suse.com/show_bug.cgi?id=1049664))
*   Set default memory size for SLES 12 installations to 1024MB ([bsc#1047707](http://bugzilla.suse.com/show_bug.cgi?id=1047707))
*   BugFix: enable remote-command for Salt clients in SSM ([bsc#1050385](http://bugzilla.suse.com/show_bug.cgi?id=1050385))
*   Add missing help icons/links ([bsc#1049425](http://bugzilla.suse.com/show_bug.cgi?id=1049425))
*   Fixed invalid help links ([bsc#1049425](http://bugzilla.suse.com/show_bug.cgi?id=1049425))
*   Fix: wrong openscap xid ([bsc#1030898](http://bugzilla.suse.com/show_bug.cgi?id=1030898))
*   Organization name allows XSS CVE-2017-7538 ([bsc#1048968](http://bugzilla.suse.com/show_bug.cgi?id=1048968))
*   Fixes overlapping text narrow window ([bsc#1009118](http://bugzilla.suse.com/show_bug.cgi?id=1009118))
*   Adapt to the salt-netapi-client update (v0.12.0)
*   Fixes alignment on the orgdetails ([bsc#1017513](http://bugzilla.suse.com/show_bug.cgi?id=1017513))
*   Fix text for activation key buttons ([bsc#1042975](http://bugzilla.suse.com/show_bug.cgi?id=1042975))
*   Add a dynamic counter of the remaining textarea length
*   Bugfix: set, check and cut textarea maxlength ([bsc#1043430](http://bugzilla.suse.com/show_bug.cgi?id=1043430))
*   MinionActionExecutor: raise skip timeout ([bsc#1046865](http://bugzilla.suse.com/show_bug.cgi?id=1046865))
*   Update channels.xml with OpenStack Cloud Continuous Delivery 6 ([bsc#1039458](http://bugzilla.suse.com/show_bug.cgi?id=1039458))
*   Do not create VirtualInstance duplicates for the same 'uuid'
*   Add taskomatic task to cleanup duplicated uuids for same system id
*   Handle possible wrong UUIDs on SLE11 minions ([bsc#1046218](http://bugzilla.suse.com/show_bug.cgi?id=1046218))
*   Removed duplicate overview menu item ([bsc#1045981](http://bugzilla.suse.com/show_bug.cgi?id=1045981))
*   Enable act-key name empty on creation ([bsc#1032350](http://bugzilla.suse.com/show_bug.cgi?id=1032350))
*   Fix NPE when there's not udev results ([bsc#1042552](http://bugzilla.suse.com/show_bug.cgi?id=1042552))
*   Alphabar: change title to 'Select first character' (bsc1042199)
*   Duplicate Systems: correct language not to mention 'profiles' (bsc1035728)
*   Fix list filters to work with URL special characters ([bsc#1042846](http://bugzilla.suse.com/show_bug.cgi?id=1042846))
*   Use getActive() instead of isActive() for JavaBeans compliance ([bsc#1043143](http://bugzilla.suse.com/show_bug.cgi?id=1043143))
*   Fix: hide non-org event details ([bsc#1039579](http://bugzilla.suse.com/show_bug.cgi?id=1039579))

spacewalk-search:

*   Remove executable bit from service files ([bsc#1051518](http://bugzilla.suse.com/show_bug.cgi?id=1051518))

spacewalk-utils:

*   Don't show password on input in spacewalk-manage-channel-lifecycle ([bsc#1043795](http://bugzilla.suse.com/show_bug.cgi?id=1043795))

spacewalk-web:

*   Fix overlapping of elem. ([bsc#1031143](http://bugzilla.suse.com/show_bug.cgi?id=1031143))
*   Fix formulas action buttons position ([bsc#1047513](http://bugzilla.suse.com/show_bug.cgi?id=1047513))
*   Do not show old messages ([bsc#1043831](http://bugzilla.suse.com/show_bug.cgi?id=1043831))
*   Add a dynamic counter of the remaining textarea length
*   Confirm if navigating away while bootstrapping

susemanager:

*   Assert correct java version ([bsc#1049575](http://bugzilla.suse.com/show_bug.cgi?id=1049575))
*   Create bootstrap repo for SLES for SAP 11 SP1 ([bsc#1049471](http://bugzilla.suse.com/show_bug.cgi?id=1049471))
*   Adjust the bootstrap repo with SLE 12 SP3 repos

susemanager-docs_en:

*   Icinga services example is confusing ([bsc#1019759](http://bugzilla.suse.com/show_bug.cgi?id=1019759))
*   Section ref Configuration Management is unclear ([bsc#1047352](http://bugzilla.suse.com/show_bug.cgi?id=1047352))
*   "host_name" is missing in service definition example for Icinga ([bsc#1049162](http://bugzilla.suse.com/show_bug.cgi?id=1049162))
*   Documentation on moving database incorrect ([bsc#1031602](http://bugzilla.suse.com/show_bug.cgi?id=1031602))
*   Missing page in Advanced Topics guide: Autoinstallation ([bsc#1047680](http://bugzilla.suse.com/show_bug.cgi?id=1047680))
*   API documentation" is not available online ([bsc#1047641](http://bugzilla.suse.com/show_bug.cgi?id=1047641))
*   Reference Guide Documentation issues in GMC2 (bsc#1045266 )
*   Update online documentation components (bsc# 1046314)
*   New: Update online documentation ([bsc#1046176](http://bugzilla.suse.com/show_bug.cgi?id=1046176))

susemanager-schema:

*   Adapt for the new gpgcheck flag for the channels

susemanager-sync-data:

*   Support SUSE Enterprise Storage 5 and SUSE LINUX Enterprise Server 12 - SP3 for SAP Applications on ppc64le ([bsc#1028098](http://bugzilla.suse.com/show_bug.cgi?id=1028098))
*   Update channels.xml with OpenStack Cloud Continuous Delivery 6 ([bsc#1039458](http://bugzilla.suse.com/show_bug.cgi?id=1039458))
*   Add the SLE 12 SP3-related products ([bsc#1037609](http://bugzilla.suse.com/show_bug.cgi?id=1037609))

<a name="toc27"></a>

# Major changes since SUSE Manager 3.0 Server

<a name="toc28"></a>

## Upgrade of base system to SLES 12 SP2

SUSE Manager 3.1 is based on SLES 12 SP2 as its base operating system.

<a name="toc29"></a>

## SUSE Manager Proxy versions

SUSE Manager 3.1 Server can work with version 3.0 of SUSE Manager Proxy.

When upgrading, upgrade the server first, followed by proxies. See the advanced topics manual for detailed upgrade instructions.

<a name="toc30"></a>

## Spacewalk 2.6

SUSE Manager 3.1 Server is based on [Spacewalk 2.6](http://spacewalk.redhat.com) with many new features added by SUSE.

<a name="toc31"></a>

## Managing Container Images

You can now enable Salt minions to act as container build hosts.

Manage and audit your container images by creating image stores, define image profiles and build images.

For more information see 'Building Containers' in the reference manual.

<a name="toc32"></a>

## UI and Usability

<a name="toc33"></a>

### Reduced vertical waste

The page header has been improved to dramatically reduce the space wasted, giving more visibility to the actual page content.

<a name="toc34"></a>

### New navigation structure

The horizontal navigation items have been moved from the page header to the left navigation plane. See 'Navigation' in the reference manual.

<a name="toc35"></a>

### Action buttons visibility

Action buttons, historically placed at the end of lists, have been moved to the top and will stay visible even if the list is scrolled down.

<a name="toc36"></a>

### Top of page button

A shortcut to scroll up to the top of the page has been added to the lower right corner of the UI.

<a name="toc37"></a>

## Visualization

You can now visualize your systems infrastructure. This feature allows you to search, filter and partition systems by name, base channel, check-in date, etc.

The initial release focusses on data from the SUSE Manager database.

Future improvements will enrich this with data from external systems, like monitoring systems or virtualization hosts.

<a name="toc38"></a>

## Scalability

SUSE Manager 3.1 Server provides many scalability enhancements over SUSE Manager 3.0 Server. Some operations have seen a ten-fold speed improvement over previous releases.

We will continue to invest into this area in further maintenance updates.

<a name="toc39"></a>

## Automatic product installation

If a newly added child channel provides a SUSE product (like a SLES module or extension), this product is automatically installed.

<a name="toc40"></a>

## Salt

<a name="toc41"></a>

### Salt update to 2016.11.4

Salt has been upgraded to the 2016.11.4 release. This represents the 'latest & greatest' release from upstream at time of 'code freeze' for SUSE Manager 3.1.

We do intend to upgrade Salt regularly to more recent versions.

<a name="toc42"></a>

### Minions in the system set manager

The system set manager (SSM) now supports minions. You can as well add or remove a minion from the current set.

The System Set Manager Overview page has an 'Apply Highstate' button now.

<a name="toc43"></a>

### Bootstrap defaults to SALT now

The 'bootstrap' script by default installs a **Salt minion** now.

The `--salt` option is deprecated.

Use `--traditional` to install a _traditional_ (non-Salt) client.

<a name="toc44"></a>

### OpenSCAP for minions

You can now work with OpenSCAP and Salt minions. To begin using OpenSCAP with Salt minions you can follow the [traditional setup guide](https://www.suse.com/documentation/suse-manager/book_suma_reference_manual/data/ref_webui_audit_openscap.html)

This feature does not yet work for minions attached via salt-ssh.

<a name="toc45"></a>

## Change of jabberd database

jabberd now uses `sqlite` in place of the `berkeley db` database to improve stability and performance. `sqlite` is the preferred database option for jabberd.

Fresh installations of SUSE Manager 3.1 Server will use `sqlite` by default.

Existing installation need to manually switch to this database as follows

<pre>      # systemctl stop jabberd
      # spacewalk-setup-jabberd
      # systemctl start jabberd
</pre>

<a name="toc46"></a>

### jabberd removal and recreation

**Notice** that the sqlite variant of the jabberd database does not get re-created automatically.

The workaround for corruptions of the old database - regular removal - does **not** apply anymore.

In case you erroneously deleted the sqlite database, jabberd will not be able to re-create it.

You need to run `/usr/share/spacewalk/setup/jabberd/create_sqlite3_database` to create the database schema and restart jabberd.

<a name="toc47"></a>

## Formulas with Forms

[Salt formulas](https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html) can be integrated with the Manager UI. A sample [Formula with Form](https://www.suse.com/communities/blog/forms-formula-success) to configure locale-related settings (timezone/locale/keyboard) is included.

<a name="toc48"></a>

## Upstream changes since SUSE Manager 3.0

_Note_: Changes from the upstream project are listed here _as-is_. There's no guarantee that all of them are actually available in SUSE Manager 3.1 Server.

<a name="toc49"></a>

### Spacewalk 2.6

*   Spacewalk now supported on Fedora 24
*   Spacewalk supports Fedora 24 clients
*   spacewalk-repo-sync improvements:
    *   now it can sync channels with several repositories
    *   it can update Kickstart Tree in a repository
    *   add possibility to sync Debian/Ubuntu? apt repositories
*   improved Python 2/3 compatibility for all tools
*   New API calls:
    *   `system.listSuggestedReboot`
    *   `actionchain.addErrataUpdate`

<a name="toc50"></a>

### Spacewalk 2.5

*   Spacewalk now supported on Fedora 23
*   Spacewalk supports Fedora 23 clients
*   System entitlements and Software Channels entitlements were removed
*   Improved first organization creation
*   OSAD now works in failover mode via proxy
*   Plenty of small enhancements and fixes
    *   'Select All' button now correctly selects only filtered systems/packages/errata etc.
    *   RDO Openstack guests are now correctly recognized as virtual guests
    *   And many, many more ...
*   New API calls:
    *   `packages.listSourcePackages`
    *   `packages.removeSourcePackage`
    *   `system.scheduleLabelScriptRun`
    *   `system.schedulePackageInstallByNevra`
    *   `system.schedulePackageRemoveByNevra`

<a name="toc51"></a>

# Support

<a name="toc52"></a>

## Supportconfig confidentiality disclaimer

When handling Service Requests, supporters and engineers may ask for the output of the supportconfig tool from the SUSE Manager Server or clients.

The standard disclaimer applies:

<pre>  Detailed system information and logs are collected and organized in a
  manner that helps reduce service request resolution times.
  Private system information can be disclosed when using this tool.

  If this is a concern, please prune private data from the log files.

  Several startup options are available to exclude more sensitive
  information. Supportconfig data is used only for diagnostic purposes
  and is considered confidential information.
</pre>

In the SUSE Manager Server's case, please be aware that supportconfig's output will contain information about clients as well.

In particular, debug data for the Subscription Matching feature contain a list of the registered clients, their installed product and some minimal hardware information (CPU socket count). It also contains a copy of subscription data available from the SUSE Customer Center.

If this is a concern, please prune data in the subscription-matcher directory in the spacewalk-debug tarball.

<a name="toc53"></a>

## Supportability of embedded software components

All software components embedded into SUSE Manager, like Cobbler for PXE booting, are only supported in the context of SUSE Manager. Stand-alone usage is not supported.

<a name="toc54"></a>

## Red Hat Channels

Managing Red Hat clients requires availability of appropriate Red Hat packages. These are not available through the SUSE Customer Center (SCC) but must be provided by other means, e.g. from a retired Red Hat Satellite installation.

<a name="toc55"></a>

## Support for EOL'ed products

The SUSE Manager engineering team provides 'best effort' support for products past their end-of-life date. See the [Product Support Lifecycle](https://www.suse.com/lifecycle) page.

This support is limited to scenarios to bring production systems to a supported state. Either by migrating to a supported service pack or by upgrading to a supported product version.

<a name="toc56"></a>

## Support for SLES 10 based systems

The SUSE Manager client stack for SLES10 based systems is identical to the one used on SLES11 based systems. SLES 10 systems managed by SUSE Manager will have the ZENworks Managemen Daemon (ZMD) and the rug command line tool removed.

Salt is not available for SLES 10.

Note that SLES 10 has already reached its end-of-life date and engineering only provides 'best effort' support.

<a name="toc57"></a>

## spacewalk-utils

spacewalk-utils, a packaged set of command line tools, continues to be L1* supported only - with some exceptions. Any of these commands needs expertise and can break your system. However, we consider these tools valuable enough to be included, but not fully supported.

* L1 (Problem determination, which means technical support designed to provide compatibility information, usage support, on-going maintenance, information gathering and basic troubleshooting using available documentation.)

The following tools of spacewalk-utils are fully supported:

*   spacewalk-clone-by-date
*   spacewalk-sync-setup
*   spacewalk-manage-channel-lifecycle

<a name="toc58"></a>

# Providing feedback to our products

In case of encountering a bug please report it through your support contact.

<a name="toc59"></a>

# Documentation and other information

[Technical Information: SUSE Manager](http://www.suse.com/products/suse-manager/technical-information) contains additional or updated documentation for SUSE Manager Server 3.1.

These Release Notes are available [online](http://www.suse.com/releasenotes). Further information about SUSE Manager is available [in the Wiki](http://wiki.novell.com/index.php/SUSE_Manager)

Visit [http://www.suse.com](http://www.suse.com) for the latest Linux product news from SUSE and [http://www.suse.com/download-linux/source-code.html](http://www.suse.com/download-linux/source-code.html) for additional information on the source code of SUSE Linux Enterprise products.

<a name="toc60"></a>

# Legal Notices

<pre>  SUSE Linux GmbH
  Maxfeldstr. 5
  D-90409 Nürnberg
  Tel: +49 (0)911 740 53 - 0
  Email: feedback@suse.com
  Registrierung/Registration Number: HRB 21284 AG Nürnberg
  Geschäftsführer/Managing Director: Jeff Hawn, Jennifer Guild, Felix Imendörffer
  Steuernummer/Sales Tax ID: DE 192 167 791
  Erfüllungsort/Legal Venue: Nürnberg
</pre>

SUSE makes no representations or warranties with respect to the contents or use of this documentation, and specifically disclaims any express or implied warranties of merchantability or fitness for any particular purpose. Further, SUSE reserves the right to revise this publication and to make changes to its content, at any time, without the obligation to notify any person or entity of such revisions or changes.

Further, SUSE makes no representations or warranties with respect to any software, and specifically disclaims any express or implied warranties of merchantability or fitness for any particular purpose. Further, SUSE reserves the right to make changes to any and all parts of SUSE software, at any time, without any obligation to notify any person or entity of such changes.

Any products or technical information provided under this Agreement may be subject to U.S. export controls and the trade laws of other countries. You agree to comply with all export control regulations and to obtain any required licenses or classifications to export, re-export, or import deliverables. You agree not to export or re-export to entities on the current U.S. export exclusion lists or to any embargoed or terrorist countries as specified in U.S. export laws. You agree to not use deliverables for prohibited nuclear, missile, or chemical/biological weaponry end uses. Please refer to the [Microfocus Legal information page](https://www.microfocus.com/about/legal) for more information on exporting SUSE software. SUSE assumes no responsibility for your failure to obtain any necessary export approvals.

Copyright © 2017 SUSE LLC. All rights reserved. No part of this publication may be reproduced, photocopied, stored on a retrieval system, or transmitted without the express written consent of the publisher.

SUSE has intellectual property rights relating to technology embodied in the product that is described in this document. In particular, and without limitation, these intellectual property rights may include one or more of the U.S. patents listed at [http://www.novell.com/company/legal/patents/](http://www.novell.com/company/legal/patents/) and one or more additional patents or pending patent applications in the U.S. and other countries.

For SUSE trademarks, see [SUSE Trademark and Service Mark list](https://www.microfocus.com/about/legal/#trademark_information). All third-party trademarks are the property of their respective owners.

<a name="toc61"></a>

# Colophon

Thank you for using SUSE Manager Server in your business.

Your SUSE Manager Server Team.
to-markdown is copyright © 2011-15 Dom Christie and is released under the MIT licence.