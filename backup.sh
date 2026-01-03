#/bin/bash

Source=$1
Destination=$2
Days=${3:-14}


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
        echo -e "$2 is ---$R failure $N" | tee -a $Logs_file
        exit 1
    fi
}

if [ $# -lt 2 ]
then
   echo -e "$R atleast pass 2 Paramater $N"
else
   echo -e "$G passed 2 paramater $ N"
fi

if [ -d $Source ]
then 
    echo -e "$G source $Source directory is exit $N"
else
    echo -e "$R source $Source directory is not exist $N"
    exit 1
fi

if [ -d $Destination ]
then 
    echo -e "$G source $Destination directory is exit $N"
else
    echo -e "$R source $Destination directory is not exist $N"
    exit 1
fi

Files=$(find $Source -name "*.log" -mtime $Days)

if [ ! -z $Files ]
then
    echo -e " $Y  files are found: $Files $N"
else
    echo -e " $G no files are found $N"
fi