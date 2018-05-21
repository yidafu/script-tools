#!/usr/bin/env bash

str="┬┯┰┳┬┯┰┳┬┯┰┳┬┯┰┳┬┯┰┳"#┬┯┰┳┬┯┬┭
str="--_<--_<--_<--_<--_<"
str="￣-_*￣-_*￣-_*￣-_*￣-_*"
str="--<<--<<--<<--<<--<<"
for i in {0..100..2}
do
    s1=${str:0:3}
    s2=${str:3:19}
    str=$s2$s1
    printf " Progress:[%-20s] %d%%\t%d k/s\r" $str $i $RANDOM
    sleep 0.1
done
printf "\n"
