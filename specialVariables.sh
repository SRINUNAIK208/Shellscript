#!/bin/bash

echo "all Varibles: $@"
echo "PID: $$"
echo "script name:$0"
echo "first argument:$1"
echo "Number of variables: $#"
sleep 100 &
echo "background PID: $!"