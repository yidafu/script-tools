#!/bin/bash

# @ref http://www.cnblogs.com/tianyapiaozi/archive/2011/06/11/2513899.html
# @ref http://www.voidcn.com/article/p-gkrqyher-bhv.html
# @ref http://smilejustforfan.blogspot.com/2012/03/bashsnippet.html

#  INTERVAL=1	#sleep time
#  TCOUNT=0	#for each TCOUNT the line twirls one increment
#
#  while :
#  do
#  	TCOUNT=$(($TCOUNT+1))
#
#  	case $TCOUNT in
#  		1)	echo -e '-'"\b\c"
#  			sleep $INTERVAL
# 			;;
#  		2) 	echo -e '\\'"\b\c"
#  			sleep $INTERVAL
#  			;;
# 		3) 	echo -e "|\b\c"
#  			sleep $INTERVAL
# 			;;
#  		4) 	echo -e "/\b\c"
#  			sleep $INTERVAL
#  			;;
#  		*)	TCOUNT=0	#reset the TCOUNT to 0
#  			;;
# 	esac
# done


#----中断计数器----#
incr=

#----旋转的斜杠----#
spin="/-\|"
echo -en "Please wait ...        \n"

#这里就是实现旋转效果的代码#
while true
do
    echo -e "\b\b${spin:incr++%${#spin}:1} \c"
    sleep 0.2
done
