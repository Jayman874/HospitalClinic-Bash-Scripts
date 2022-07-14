#!/bin/bash

#must be running in the background while changes occur
#notifies when any items are created, modified or deleted in the WellingtonClinic Directory
inotifywait -m -e modify,create,delete -r /opt/WellingtonClinic |
    while read -r file; do
        #gets details to display for audited file
        name=$(stat --format %U $file 2>/dev/null) 
        date=$(stat --format %y $file 2>/dev/null)
        files=( $file )
        echo "Username: $name"," Object: ${files[2]}"," Operation: ${files[1]}"," Date: ${date%.*}"
    done