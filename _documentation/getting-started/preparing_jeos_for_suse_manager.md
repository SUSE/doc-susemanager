## Preparing JeOS for SUSE Manager {#preparing-jeos-for-suse-manager}

Procedure 1.2. Preparing JeOS for SUSE Manager Installation

1.  Register with SCC:

    ```
    # SUSEConnect -e EMAIL_ADDRESS -r SUSE_MANAGER_CODE
    ```

2.  Add SUSE Manager repositories:

    ```
    # SUSEConnect -p SUSE-Manager-Server/3.1/x86_64 -r SUSE_MANAGER_CODE
    ```

3.  Install patterns-openSUSE-yast2_basis pattern. _You will need this basic administration package for preparing storage partitions_:

    ```
    # zypper in pattern -t patterns-openSUSE-yast2_basis
    ```

4.  Partition and mount the virtual disks at the following locations using YaST Partitioner (**yast2 disk**).

    | VirtIO Storage Disks | Name | Storage Size | File System Type |
    | --- | --- | --- | --- |
    | VirtIO Disk 2 | `/var/spacewalk` | 101 GB | XFS |
    | VirtIO Disk 3 | `/var/lib/pgsql` | 50 GB | XFS |
    | VirtIO Disk 4 | `/swap` | 4 GB | swap |

5.  SLES 12 by default uses the BTRFS file system. A mount point is created automatically for `/var/lib/pgsql/` (even when not installed). This must be removed or commented out from the `/etc/fstab` entries. As `root` edit `/etc/fstab` and comment out or remove the line:

    ```
    /var/lib/pgsql btrfs subvol=@/var/lib/pgsql 0 0
    ```

    ### Removing the /etc/fstab pgsql Entry {#removing-the-etc-fstab-pgsql-entry}

    If you do not remove this line from fstab the first time you shutdown the server you will lose your database. This occurs because you will have duplicate entries in the fstab.

6.  Exit partitioner and install the SUSE Manager pattern:

    ```
    # zypper in -t pattern suma_server
    ```

7.  Execute SUSE Manager setup:

    ```
    # yast2 susemanager_setup
    ```

Proceed to

???

.