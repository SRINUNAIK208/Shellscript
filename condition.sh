#!/bin/bash

Num=$1

if [ $Num -gt 18 ]
then
    echo "Eligible for voting"
else
    echo "not eligible for voting"

fi