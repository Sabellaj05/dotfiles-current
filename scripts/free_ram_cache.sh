#!/bin/bash

# --- Commands to Clean RAM Cache ---

# 1. Display current memory status, focusing on total and buff/cache
echo "Current RAM cache status (before cleaning):"
# This grep pattern specifically looks for the "Mem:" line (which contains total, used, free, etc.)
# and the "buff/cache" column, which is what we are targeting to clear.
# free -h doesn't have a specific "cache" line, but "buff/cache" indicates cached memory.
free -h | grep -E -i 'total|Mem:'

# 2. Flush filesystem buffers and clear pagecache, dentries, and inodes
# 'sync' ensures all pending writes to disk are completed first.
# 'echo 3 > /proc/sys/vm/drop_caches' tells the kernel to clear the caches.
# This operation is safe as it only clears data not actively in use by applications
# and data that has already been written to disk.
echo "Cleaning RAM cache..."
sudo sync && sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

echo "RAM cache cleaning complete.\n"

# 3. Display memory status after cleaning to verify
echo "Current RAM cache status (after cleaning):"
free -h | grep -E -i 'total|Mem:'
