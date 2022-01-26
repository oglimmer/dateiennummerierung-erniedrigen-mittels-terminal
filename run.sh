#!/usr/bin/env bash

set -eu

new_index=3
last_index=""
for file in KSAufgabePHSW*
do 
    number=$(echo $file | grep -o '[[:digit:]]*')
    if (( $number >= 5 ))
    then        
        if [ "$last_index" != "$number" ]
        then        
            last_index=$number
            new_index=$((new_index+1))
        fi 
        new_file=$(echo $file|sed -E 's/[0-9]+/'$(printf "%02d" $new_index)'/g')
        echo "mv $file $new_file"
    fi
done
