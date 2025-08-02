#!/bin/bash

# --- Commands to Reset Swap Partition ---

# 1. Stop all swap activity
# This command disables all swap areas listed in /etc/fstab.
# It forces any data currently in swap to be moved back into physical RAM.
# IMPORTANT: Ensure you have enough free RAM to avoid system unresponsiveness.

echo "Current swap status:"
sudo free -h | grep -E -i 'total|swap'

echo "Stopping swap..."
sudo swapoff -a

# 2. Re-enable all swap activity
# This command re-enables all swap areas listed in /etc/fstab.
echo "Re-enabling swap..."
sudo swapon -a

echo "Swap reset complete.\n"

# You can add a check here to verify swap status if you like:
echo "Current swap status:"
free -h | grep -E -i 'total|swap'
