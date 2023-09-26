#!/bin/bash
# Darrielle Evans
# September 25, 2023
# Purpose: To check if a file exists in the current directory


path=$(pwd)

while true 
do
    read -p "Please enter the name of the file you are looking for: " fileName

    if [ "$fileName" == "" ]
    then
        echo "Please enter a correct file name or enter exit if you want to quit"
        sleep 5
        if [ "$fileName" == "exit" ]; then
            break
        fi
        
    elif [ -f $path/$fileName ]; then
        read -p "File Exists. Enter continue if you want to search again or exit if you are done. " nextAction
        if [ $nextAction == "continue" ]; then
            continue
        elif [ $nextAction == "exit" ]; then
            break
        fi
    else 
        read -p "File Does Not Exist. Enter continue if you want to search again or exit if you are done. " nextAction
        if [ $nextAction == "continue" ]; then
            continue
        elif [ $nextAction == "exit" ]; then
            break
        fi
    fi
done

