#!/bin/bash
#first boring version....

SED_FILE="demo.sed"
UNCLEAN_FILE=".converted.sed"
START_VALUE="Dinge"

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
VIOLET="\033[1;35m"
NORMAL="\033[0m"

[ -z $1 ] || SED_FILE=$1


s1(){
	echo -n "LOADING"
	sleep 0.2s; echo -n .
	sleep 0.1s; echo -n .
	sleep 0.1s; echo -n .
	sleep 0.2s; echo -n .
	sleep 0.2s; echo -n .
	sleep 0.1s; echo -n .
	echo -e "${GREEN}DONE${NORMAL}."
	sleep 0.3s
}

s2(){
	tput cup 1 13
	echo -n -e "${GREEN}DONE${NORMAL}."
        tput cup 1 12; sleep 0.2s; echo -n .
        tput cup 1 11; sleep 0.1s; echo -n .
        tput cup 1 10; sleep 0.1s; echo -n .
        tput cup 1 9; sleep 0.2s; echo -n .
        tput cup 1 8; sleep 0.2s; echo -n .
        tput cup 1 7; sleep 0.1s; echo -n .
	tput cup 1 0
	echo -n LOADING
	tput cup 2 0
}
s3(){
			cat /proc/cpuinfo
			sleep 0.3
			echo "askdjalksdwebcnewoincuebbvieso8cn098bybhbkw4bhbv534vbhwbeskhjbh4cthvnlbuyrvv4cs"|od
			sleep 0.1
}

spaces(){
	x=`tput cols`

}


spam(){
	echo COMPILING...
	sleep 0.7
	case $(( $RANDOM%3 )) in
		0) s1;;
		1) s2;;
		2) s3;;
		*)
		s1;;
	esac
}

convert(){
	sleep 0.1 					# Wait for file to exist
	sed -e 's/[()]/\\&/g' $SED_FILE > $UNCLEAN_FILE # Niceify brackets
	echo -n -e "$BLUE"				# Blueify output
 	echo $START_VALUE | sed -n -f $UNCLEAN_FILE	# Output the output
	echo -n -e "\033[0m"				# Rewhiteify output
}


# wait for the file to be edited
while inotifywait -q -e MOVE_SELF $SED_FILE &> /dev/null ;do
	tput clear
	spam
	echo -e "\nLivedemo result:\n"
	convert
done
