#!/bin/bash

Source=$1
Destination=$2
Days=${3:-14}

if [ -d $Source ]
then 
    echo -e "Source directory $Source is exits"
else
    echo -e "Source directory $Source is not exists"
fi
if [ -d $Destination ]
then 
    echo -e "Source directory $Destination is exits"
else
    echo -e "Source directory $Destination is not exists"
fi
   
Files=$(find $Source -name "*.log" -mtime +$Days)

if [ -z $Files ]
then 
   echo "files is not found"
else
   echo "files are found:: $Files"
   TimeStamp=$(date +%F-%H-%M-%S)
   Zip_File=$Destination/app-log/$TimeStamp.zip
   find $Source -name "*.log" -mtime +Days | zip -@ $Zip_File

   if [ -f $Zip_File ]
   then
      echo "zip file is created successfully"
      while IFS=read -r line
      do 
        echo "deleting files: $line"
        rm -rf $line
      do <<< $Files
   else
      echo "zip file is create failed"
    fi
fi