#!/bin/bash

echo 'Enter name of file to be copied: '
read dFile
echo 'Enter name of destination directory: '
read dDir
echo 'Checking exceptions'

if [ ! -e "$dFile" ] && [ ! -d "$dDir" ]; then # File and folder do not exist
    echo 'File path and name does not exist'
    echo 'Destination does not exist'
    exit 1
elif [ ! -e "$dFile" ] && [ -d "$dDir" ]; then # File does not exist while folder does
    echo 'Sorry! file does not exist.'
    # ask user to agree to create the file
    echo ============================
    echo 'Would you like to create the file? Yes [y] or No [n]'
    case $yn in
        [Yy] ) touch $dFile;;
        [Nn] ) exit;;
        * )
    esac
    echo 'File created... copying to the designated folder'
    cp $dFile $dDir
    ls $dDir
elif [ -e "$dFile" ] && [ ! -d "$dDir" ]; then # File exists and floder does not
    echo 'The designated directory does not exist'
    echo 'Creating directory'
    mkdir $dDir
    echo
    echo 'Copying files now'
    cp $dFile $dDir
    ls $dDir
else # File and folder exists
    echo 'Copying files now'
    cp $dFile $dDir
    ls $dDir
fi