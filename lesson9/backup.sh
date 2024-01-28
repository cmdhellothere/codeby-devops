#!/bin/bash
TIME=`date +%H:%M-%m-%d-%Y`
DIR=/opt/mysql_backup/
DB=les9

if [ ! -d "$DIR" ];
then    mkdir -p "$DIR"
fi

mysqldump $DB > "$DIR$TIME-$DB".sql
echo "Create backup of "$DB" in "$DIR""$TIME-$DB".sql"