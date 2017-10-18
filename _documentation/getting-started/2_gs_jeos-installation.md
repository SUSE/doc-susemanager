---
layout: documentation
title: Jeos Installation
category: Getting-started
order: 2
---


## Virtual Machine Manager (virt-manager) Settings {#virtual-machine-manager-virt-manager-settings}

#### Version Information {#version-information}
```
SUSE Manager 3.1 was originally released as a SLES 12 SP2 extension. With the next maintenance update (2017),
SUSE Manager 3.1 will be based on SLES 12 SP3 and it will support SLE 12 SP3 clients officially. In the following
sections and chapters, it is highly recommended to use SLE 12 SP3 instead of SP2.
```
This chapter provides the required (KVM) settings for installation of SUSE Linux Enterprise Just Enough Operating System (JeOS) 12 as the base for SUSE Manager 3.1\. A kernel virtual machine (KVM) combined with Virtual Machine Manager, `virt-manager` will be used as a sandbox for your first installation.

### SUSE Virtualization Guide {#suse-virtualization-guide}

For more information on virtualization, see:
 * [https://www.suse.com/documentation/sles-12/singlehtml/book_virt/book_virt.html](https://www.suse.com/documentation/sles-12/singlehtml/book_virt/book_virt.html)

Enter the following settings when creating a new virtual machine using **virt-manager**.

| KVM Settings         |                                                      |
| ---                  |---                                                   |
| Installation Method: | Import Existing Disk Image                           |
| OS:                  | Linux                                                |
| Version:             | SLES12-SP2-JeOS-for-kvm-and-xen.x86_64-GM.qcow2      |
| Memory:              | 4096 MB                                              |
| CPU&#039;s:          | 2                                                    |
| Storage Format:      | .qcow 24 GB (Default) JeOS Root Partition            |
| Virtual Disks:       |                                                      |
| VirtIO Disk2         | 101 GB for /var/spacewalk                            |
| VirtIO Disk3         | 50 GB for /var/lib/pgsql                             |
| VirtIO Disk4         | 4 GB for swap                                        |
| Name:                | example-server                                       |
| Network              | Bridge br0                                           |

### SUSE Virtualization Guide {#suse-virtualization-guide-0}

For more information on virtualization, see [https://www.suse.com/documentation/sles-12/singlehtml/book_virt/book_virt.html](https://www.suse.com/documentation/sles-12/singlehtml/book_virt/book_virt.html).
