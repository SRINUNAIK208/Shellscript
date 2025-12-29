#!/bin/bash

Userid=$(id -u)

if [ $Userid -eq 0 ]
then 
    echo "user is running script in root access"
else
    echo "user is not running script in root access"
    exit 1
fi

dnf install mysql -y