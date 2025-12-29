#!/bin/bash

Userid=$(id -u)

if [ $Userid -eq 0 ]
then 
    echo "user is running script in root access"
else
    echo "user is not running script in root access"
    exit 1
fi

VALIDATE(){
      if [ $1 -eq 0 ]
    then
       echo "$2 is installed success"
    else
       echo "$2 is not installed"
       exit 1
    fi
}

dnf list installed nginx

if [ $? -eq 0 ]
then
    echo "nginx package is installed"
else
    echo "nginx package is not installed"
    dnf install nginx -y
    VALIDATE $? "nginx"
fi


dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "mysql package is installed"
else
    echo "mysql package is not installed"
    dnf install mysql -y
    VALIDATE $? "mysql"
fi

dnf list installed python3

if [ $? -eq 0 ]
then
    echo "python3 package is installed"
else
    echo "python3 package is not installed"
    dnf install python3 -y
    VALIDATE $? "python3"
   
fi
