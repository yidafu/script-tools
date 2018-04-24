#!/usr/bin/env bash

who=$1

if [ "$USER" = "s" ];then
  echo $who" is here."
else
  echo "$who is not here."
fi
