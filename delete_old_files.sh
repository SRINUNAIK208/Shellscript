#!/bin/bash

UserId=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_Folder="/var/log/shellscript-log"
Script_Name="$(echo $0 | cut -d "." -f1)"
Logs_file="$Logs_Folder/$Script_Name.log"

mkdir -p $Logs_Folder

if [ $UserId -eq 0 ]
then
    echo -e  "$G user have root access $N" | tee -a $Logs_file
else
   echo -e "$R user have not root access $N" | tee -a $Logs_file
   exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is...$G sucess $N" | tee -a $Logs_file
    else
        echo =e "$2 is ---$R failure $N" | tee -a $Logs_file
        exit 1
    fi
}


Source_Dir=/home/ec2-user/

Files_to_delete=$(find $Source_Dir -name "*.log" -mtime +14) | tee -a $Logs_file

while IFS= read -r line
do
    echo "Deleting file: $line" 
    rm -rf $line 
done <<< $Files_to_delete