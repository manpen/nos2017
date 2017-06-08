#first boring version....

SED_FILE="foo.sed"
UNCLEAN_FILE=".converted.sed"
START_VALUE="LIVEDEMO"



s1(){
	echo -n "LOADING"
	sleep 0.2s; echo -n .
	sleep 0.2s; echo -n .
	sleep 0.2s; echo -n .
	sleep 0.2s; echo -n .
	sleep 0.2s; echo -n .
	sleep 0.2s; echo -n .
	echo DONE.
}

spam(){
	s1
}

convert(){
	sed -e 's/[()]/\\&/g' $SED_FILE > $UNCLEAN_FILE
	echo -n -e "\033[1;31m"
 	echo $START_VALUE | sed -f $UNCLEAN_FILE
	echo -n -e "\033[0m"
}


while inotifywait -q -e MOVE_SELF $SED_FILE &> /dev/null ;do
	spam
	convert
done
