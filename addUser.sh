#!/bin/bash


### ask the user if they want to create an account

read -p "Would you like to create an account to work today? " decision

 if [ "$decision" = "yes" ]
 then
# -r flag prevents backslashes from being added to the array
# -a flag saves input as an array
#remember arrays read spaces as new index
# -q prevents output from being printed
  read -p "Please enter a username." userName
  read -r -p "Please enter the groups you want to be added to. " -a groupName

#for loop searches for each groupName. If it exists, add user. If it doesn't create group then add user.
  for names in "${groupName[@]}"; do

   if grep -i -q "$names" /etc/group;
   then
    sudo useradd -m -G "$names" "$userName"
    sudo passwd "$userName"
    echo "user added to group "  
   else
    sudo groupadd "$names" 
    sudo useradd -m -G "$names" "$userName"
    sudo passwd "$userName"
    echo "user and group added"
   fi
  done
  
 elif [ "$decision" = "no" ]
 then
  echo "Program Ending"
 fi
