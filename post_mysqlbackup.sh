#!/bin/bash


# Directory where your mysql dumps are stored.
# This should be the same as the directory included within your backups.
BACKUP_DIR='/directory/to/mysql/'

# The amount of days that the files will be kept before being
# removed from the active backup. These will roll into versioning
# if this directory is included in backups and will be held 
# according to the retention set in the software
PURGE_PERIOD='7'

# Finds files older than the PURGE_PERIOD set above and 
# deletes them.
find $BACKUP_DIR -mtime $PURGE_PERIOD -type f | xargs rm

# Removes empty directories. Empty directories can occur as the 
# result of the previous deletion. 
find $BACKUP_DIR -type d -empty | xargs rm -rf

