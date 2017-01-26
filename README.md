# doc-susemanager-new

#SUSE Manager Documentation Repository#
![](https://www.ccpsoft.de/fileadmin/images/de/software/suse/susemanager/suse-manager-logo-mobile-app.png)
**This readme is currently under development**

This is the source for the official SUSE Manager documentation update.
During the SUSE Manager 3 update we successfully condensed and reworked the six original SUSE Manager documentation books into four shiny new manuals. 

*As this represents a large body of work, many smaller topics/bugs and revisions will not be included. Keep in mind topics are subject to change depending on development priorities. We will attempt to keep this list up-to-date as documentation develops. A new Documetnation updates book is in the works and should be released with 3.1. This document will provide links to all new section content added within a single maintenence update.*

## TODO:
* rhn.conf parameters (MB Best Practices contains most of these options)
* API Use (Create some solid examples based of scripts from field)
* Salt (Ongoing) The GS guide needs work after our internal training I will review with Karl and Frank SLES vs. Manager
* Error feedback & logging (Not much on this)
* Autoinstallation (exists in 2.1 needs to be updated for Salt and added to 3.1
* Command Line Tools (Not much on this: Cloning Tools, lifecycle etc.) ( We have Jeffs lifecycle guide which is a solid start)
* Organization and Group Management (Setup using salt and traditional methods)
* Patching Systems (Clarify methods for patching an organization, group or system) salt and traditional


 
# Current work list:
New work items will be added here. The status of these items will be marked with:

* IN_PROG
* DONE
* NEXT
* DEVEL

## Galaxy/Devel/suse-manager/ (3.0):
- [x] Migration from svn to Github new repo: DONE
- [x] New TOC for books created with customer, engineering & sales feedback: DONE
- [x] Channel Management: DONE
- [x] SUSE Manager and System z: DONE
- [x] Docreview Development Begins (Currently Internal for uniting QA, DEV, ENG, and Documentation: Pare work with Kwalter)
- [x] Writethedocs Conference Prague: DONE
- [x] Quickstart Guide Installation: DONE
- [x] Quickstart Guide Setup: DONE
- [x] Quickstart Using Salt (Technical Preview Draft 1): DONE
- [x] DocBook version 4.5 to 5.1 migration: DONE
- [x] DocReview in production: DONE
- [x] Best Practice Draft 1: DONE
- [x] Advanced Topics Book Draft 1: DONE
- [x] Optimizing Apache Tomcat Parameters: DONE
- [x] Book / chapter and section ID's updated to reflect SUSE Manager WebUI KE/MC/Coyote: DONE
- [x] Contact Methods (rhnsd, ssh push, ssh push tunnel, osad, salt): DONE
- [x] Managing Entitlements SCC and SMT: DONE
- [x] Reference Book Update: DONE
- [x] Advanced Patch Lifecycle Management Draft 1: DONE
- [x] Activation Key Use and Guidelines: DONE
- [x] Subscription Matching: DONE
- [x] System Details: Salt State Components Draft 1 (Packages, Custom, Highstate): DONE
- [x] 2.1 - 3 Comparison Chart and Supported Features: Maintained : DONE
- [x] SUSE Manager 3 Proxy: DONE
- [x] Licenses for AT and BP: DONE
- [x] Icinga Guide: DONE
- [x] Adding a VMware ESXi Host to SUSE Manager: DONE 
- [x] Using Salt Proxies: DONE
- [x] Expanded Support Draft 1: DONE
- [x] Config Management with Salt Draft 1: DONE
- [x] Salt Minion Scalability Draft 1: Will be revised later with Moio's work: DONE
- [x] Common Administration Tasks: Done
- [x] Database Backup and Restoration Draft 1: DONE
- [x] System Audititing and Security Management: DONE
- [x] Troubleshooting Draft 1: Ongoing : DONE
- [x] Additional Resources (YAML, JINJA, Salt BP): Ongoing: DONE
- [x] Using Custom SSL Certificates: DONE
- [x] Documentation Updates Book Draft 1: DONE
- [x] White Papers Book (Internal for ENG, QA, Testing) May release specific docs to .com: DONE
- [x] Writing Custome Salt Grains Draft 1: (White Papers): DONE
- [x] Creating Custom Execution Modules Draft 1: DONE
- [x] Creating a Machinery Renderer Draft 1: DONE
- [x] Writing a Salt Execution Module for the Raspberry Pi 3 and a SenseHat Module: DONE
- [x] Salt Formulas and Forms Draft 1: DONE
- [x] Live Patching: DONE
- [x] spacecmd Reference: DONE
- [x] Service Pack Migration: DONE
- [x] Salt Getting Started Draft 1 : DONE
- [x] Update 2.1 - 3 Migration: DONE
- [x] Update Refs SP1 - SP2: DONE
- [ ] Using a proxy during SLES Setup (Manager installation): IN_PROG
- [ ] Connecting minions to trusted master only: NEXT
- [ ] Live Patching Cleanup: NEXT

## Galaxy/Devel/Head/ (3.1)
- [ ] Documentation Updates Book (Customers can see what has been added recently with links to content Manager/build.suse.de
- [ ] Content Management: DEVEL
- [ ] Config Drift: DEVEL
- [ ] openScap Minions: DEVEL
- [ ] GS Update (Salt and Traditional clean up): 
- [ ] Visualization: DEVEL
- [ ] Salt SSH Push: DEVEL

##DEVEL Wiki Cleanup

After each update remove obsolete pages from wiki and link to official docs. This is the removal list:

- [ ] https://wiki.microfocus.com/index.php?title=SUSE_Manager%2FOsad_and_jabberd_troubleshooting&type=revision&diff=43882&oldid=43881

##Contributing##

If you would like to contribute, please fork this repository and send pull requests.

Contributors with direct access to the repository are encouraged to use the git-flow-avh workflow (package git-flow-avh).
Note:
	
Please do not make any commits to the master branch. master is reserved for releases only. 


##Updating the SUMA 3 Documentation Package (susemanager-docs_en)##

* The build repo is defined in DEF-susemanager_docs
* Perform these steps on both, Head and 3.0 (set the OBS_REPO variable accordingly)


```
OBS_USER=keichwa
OBS_USER=jcayouette

Add for Head:
OBS_REPO=Devel:Galaxy:Manager:Head

Add for 3.0
OBS_REPO=Devel:Galaxy:Manager:3.0

daps -d DC-create-all package-src --set-date=$(date --iso) \
     --def-file DEF-susemanager-docs

# save old checkout
old home:$OBS_USER:branches:$OBS_REPO/susemanager-docs_en

osc -A https://api.suse.de bco $OBS_REPO susemanager-docs_en
cd home:$OBS_USER:branches:$OBS_REPO/susemanager-docs_en
cp ../../build/create-all/package/create-all_en_src_set.tar.bz2 .
osc vc -m "Update text and image files."
osc ci -m "update"

# check results; e.g. with:
osc pr

osc sr -m 'update'

```



##Preparing and Publishing Online Documentation (suse.com/documentation)##

ATM (2016-07-13), you must use a recent `daps` checkout from
`git@github.com:openSUSE/daps.git`.

Switch to the directory of the documentation checkout and enter:

```
.../daps/bin/daps --dapsroot .../daps -d DC-create-all online-docs
```

Repeat it for all the `pdfsub` packages listed in `DEF-susemanager-docs`:

```
.../daps/bin/daps --dapsroot .../daps -d DC-DC-susemanager-getting-started online-docs
.../daps/bin/daps --dapsroot .../daps -d DC-DC-susemanager-reference online-docs
.../daps/bin/daps --dapsroot .../daps -d DC-DC-susemanager-best-practices online-docs
.../daps/bin/daps --dapsroot .../daps -d DC-DC-susemanager-advanced-topics online-docs
```

Copy the results to the results to your `~/Exports` directory.

```
mkdir ~/Export/susemanager-3
cp -va build/{create-all,susemanager-advanced-topics,\
susemanager-best-practices,susemanager-reference,\
susemanager-getting-started}/online-docs/* ~/Export/susemanager-3 
```

Create a bug (Classification: Doc Tools, Product: Doc Production,
Component: SUSE Manager) and ask to update
[http://www.suse.com/documentation/suse-manager-3](http://www.suse.com/documentation/suse-manager-3)
accordingly.  As an example, see [bug
975925](https://bugzilla.suse.com/show_bug.cgi?id=975925) or [bug
981142](https://bugzilla.suse.com/show_bug.cgi?id=981142).


##Updating SUSE Manager API Documentation and Posting Online##

SUSE Manager 3 (SLE 12 SP1 example):

```
# rename existing directory
old binaries

# checkout the official binary packages
iosc getbinaries SUSE:SLE-12-SP1:Update:Products spacewalk-java standard x86_64

# get the docbook file
unrpm binaries/spacewalk-java-apidoc-sources*
# ==>
# usr/share/doc/packages/spacewalk-java/xml/susemanager_api_doc.xml

# build the PDF with daps:
daps -m usr/share/doc/packages/spacewalk-java/xml/susemanager_api_doc.xml pdf
```

Then create a bug (Classification: Doc Tools, Product: Doc Production,
Component: SUSE Manager) and ask to update
suse.com/documentation/suse-manager-3 accordingly.  As an example, see
https://bugzilla.suse.com/show_bug.cgi?id=976225 .

##Publishing Release Notes on https://www.suse.com/releasenotes/##

If not already done, ask Rudi or Lars (Vogt) to mirror the release notes
from the release repo, and then add the new version to
https://www.suse.com/releasenotes/ .  After publishing the first update,
you probably ask Rudi or Lars again to the mirror script.
