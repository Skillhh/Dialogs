#!/bin/bash

# getpasswd1.sh - A simple shell script to read users password.
# password storage
data=$(tempfile 2>/dev/null)

# trap it
trap "rm -f $data " 0 1 2 5 15

# get password
dialog --title "Password " \
--clear \
--passwordbox "Enter your password " 10 30 2> $data

ret=$?

watch_passwd(){
	local pswd=$(cat $data)
	dialog --title "Watchin Password" --clear\
	--msgbox "Password is: ${pswd}" 10 30 
}

# make decision

case $ret in
	0) 
#		echo "Password is $(cat $data)"
		watch_passwd
	;;
	1)
		echo "Cancel pressed."
	;;
	255)
		[ -s $data ] && cat $data || echo " ESC pressed."
	;;
esac
