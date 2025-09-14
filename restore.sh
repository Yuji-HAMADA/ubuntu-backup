#!/bin/bash

# This script restores the system from the backup files.

# Restore apt packages
echo "Restoring apt packages..."
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < packages.list
sudo apt-get dselect-upgrade -y

# Restore snap packages
echo "Restoring snap packages..."
while read -r name version rev tracking publisher notes; do
  if [ "$name" != "Name" ]; then
    sudo snap install "$name"
  fi
done < snap-packages.txt

echo "Restore complete."
