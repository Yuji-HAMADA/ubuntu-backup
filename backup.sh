#!/bin/bash

# This script updates the backup of the system's package lists and configuration.

# Generate system information
echo "Generating system information..."
uname -a > system-info.txt
lsb_release -a >> system-info.txt
printenv >> system-info.txt

# Generate list of installed packages
echo "Generating package lists..."
dpkg --get-selections > packages.list

# Generate list of installed snap packages
echo "Generating snap package list..."
snap list > snap-packages.txt

echo "Backup updated successfully."
