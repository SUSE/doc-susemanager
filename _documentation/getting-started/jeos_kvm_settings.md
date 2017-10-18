## JeOS KVM Settings {#jeos-kvm-settings}

Create 3 additional virtual disks required for the SUSE Manager storage partitions.

Procedure 1.1. Creating the Required Partitions with KVM

1.  Create a new virtual machine using the downloaded JeOS KVM image and select Import existing disk image.

2.  Configure RAM and number of CPU&#039;s: At least 4 GB RAM and 2 CPUs.

3.  Name your KVM machine and select the &gt;Customize configuration before install check box.

4.  Select the Add Hardware button and create three new virtual disks with the following specifications. These disks will be partitioned and mounted in the following procedure.

    | VirtIO Storage Disks | Name | Sizing |
    | --- | --- | --- |
    | VirtIO Disk 2 | spacewalk | 101 GB |
    | VirtIO Disk 3 | pgsql | 50 GB |
    | VirtIO Disk 4 | swap | 4 GB |

5.  Select Begin Installation and your new VM will boot from the JeOS image.

Proceed through the basic JeOS installation prompts until you reach the command line.