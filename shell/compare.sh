#!/usr/bin/env bash

echo $1,$2

flag=false
# 整数判断
expr $1 + 0 &>/dev/null

if [ $? -ne 0 ];then
	flag=true
fi


expr $2 + 0 &>/dev/null

if [ $? -ne 0 ];then
	flag=true
fi

if [ "$flag" = "true" ];then
	echo "you should input number!"
	exit 3
fi
if [ $1 -lt $2 ];then
	echo "$1 < $2"
elif [ $1 -gt $2 ];then
	echo "$1 > $2"
else
	echo "$1 == $2"
fi

echo "$1+$2="$(($1+$2))
echo "$1-$2="$(($1-$2))
echo "$1*$2="$(($1*$2))
echo "$1/$2="$(($1/$2))
