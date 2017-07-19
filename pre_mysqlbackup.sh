#!/bin/bash

# Creates the current date/time to be included in the backup folder name 
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")

# Directory where you would like to store the mysql dumps.
BACKUP_DIR="/directory/to/mysql/$TIMESTAMP"

# Verify these MySQL paths on your system.
MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump

MYSQL_USER="[USERNAME]"
MYSQL_PASSWORD="[SQL PASSWORD]"

# Creates the directory where the dumps are stored 
mkdir -p $BACKUP_DIR
 
# Grabs a list of databases within MySQL
databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`
 
# Creates a dump for each database within MySQL and stores in the previously created directory
for db in $databases; do
  $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | gzip > "$BACKUP_DIR/$db.gz"
done
