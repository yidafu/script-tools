#!/usr/bin/env bash

definedPasswd="123456"

echo -e "login:\c"
read name
echo -e "password:\c"
read -s passwd

if [[ "$passwd" = "$definedPasswd" && "$name" = "root" ]] ; then
	echo -e "\n"
	echo -e "\tWelcome to zaza linux!"
	echo ""
	echo -e "$name@zaza-linux:~$\c"
	read nothingTodo
else
	echo -e "\n your user name or passwd was wrong!!"
fi
