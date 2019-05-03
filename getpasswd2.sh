#!/bin/bash

# getpasswd2.sh - A sample shell script to read users password.
# password storage
data=$(tempfile 2>/dev/null)

# trap it
trap "rm -f $data" 0 1 2 5 15

# get password with the --insecure option
dialog --title "Password" --backtitle "getpasswd2.sh"\
--clear \
--insecure \
--passwordbox "Enter your password" 10 30 2> $data

ret=$?

watch_passwd(){
	local pswd=$(cat $data)
	dialog --title "Watching Password" --backtitle "getpasswd2.sh" \
	--clear --msgbox "Password is: ${pswd}" 10 30
}

cancel_pressed(){
	dialog --title "Canceled" --backtitle "getpasswd2.sh" \
	--clear --msgbox "CANCELED" 10 30
}

# make decision
case $ret in
	0)
	#	echo "Password is $(cat $data)"
		watch_passwd
	;;
	1)
	#	echo "Cancel pressed."
		cancel_pressed
	;;
	255)
		[ -s $data ] && cat $data || echo "ESC pressed."
	;;
esac
