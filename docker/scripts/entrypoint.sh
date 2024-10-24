#!/bin/bash

# Check if the volume-mounted wp-content directory is empty
if [ -z "$(ls -A /opt/app-root/src/wp-content)" ]; then
    echo "wp-content directory in the volume is empty. Copying content from the directory that the init container created"
  
    cp -R /wp-content-backup/* /opt/app-root/src/wp-content/
else
    echo "wp-content directory in the volume is already populated."
fi

# Pass control to the CMD (S2I run)
exec "$@"
