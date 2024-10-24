#!/bin/bash

# Copy wp-content to a temporary location before the volume is mounted
mkdir /tmp/wp-content-backup
cp -R /opt/app-root/src/wp-content /tmp/wp-content-backup

# Check if the volume-mounted wp-content directory is empty
if [ -z "$(ls -A /opt/app-root/src/wp-content)" ]; then
    echo "wp-content directory in the volume is empty. Copying backup from image..."
    # Copy the backup from /tmp/wp-content-backup to the volume
    cp -R /tmp/wp-content-backup/* /opt/app-root/src/wp-content/
else
    echo "wp-content directory in the volume is already populated."
fi

# Pass control to the CMD (S2I run)
exec "$@"
