#!/usr/bin/env bash

echo Enter filename to copy:
read -r files
echo
echo Enter Directory to copy files to:
read -r dir
echo
echo copying file\(s\) $files to $dir directory

#check if file exists
for file in $files; do
    if [ ! -e "$file" ]; then
        echo file does not exist
        exit 0
    else
        if [ ! -d "$dir" ]; then #check if dir exists
            mkdir $dir
            echo $dir
        fi
        cp "$file" "$dir"
    fi
done
ls $dir
echo 'Copying is done'