#!/bin/bash

Userid=$(id -u)

if [ $Userid -eq 0 ]
then 
    echo "user is running script in root access"
else
    echo "user is not running script in root access"
    exit 1
fi

#dnf install mysql -y

#if [ $? -eq 0 ]
#then
  # echo "mysql is installed success"
#else
  # echo "mysql is not installed"
  # exit 1
#fi

dnf list installed nginx

if [ $? -eq 0 ]
then
    echo "nginx package is installed"
else
    echo "nginx package is not installed"
    dnf install nginx -y

    if [ $? -eq 0 ]
    then
       echo "nginx is installed success"
    else
       echo "nginx is not installed"
       exit 1
    fi
    exit 1
fi
