#!/usr/bin/env bash

str=("|" "/" "-" "\\")
index=0
char=
j=0
for i in {0..100..5}
do
    index=$(($i % 4))
    char=${str[$index]}
    echo -e "\b\b\b\b\b$char $i%\c"
    sleep 0.1
done
