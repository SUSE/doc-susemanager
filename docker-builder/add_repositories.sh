#!/bin/bash
set -e

zypper ar -f http://download.opensuse.org/repositories/Publishing/openSUSE_Leap_15.0/ "Documentation Publishing"
zypper ar -f http://download.opensuse.org/repositories/Documentation:/Tools/openSUSE_Leap_15.0/ "Documentation Tools"
