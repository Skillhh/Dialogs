#!/bin/bash
# dvdcopy.sh - A sample shell script to display a progress bar
# Set counter to 0
counter=0
(
# Set infinite while loop
while :
do
cat <<EOF
XXX
$counter
Disk copy /dev/dvd to /home/data  ( $counter % ):
XXX
EOF

	/bin/dd $counter if=/dev/sr0 of=open_suse.iso &>/dev/null 

# increase counter by 10
	(( counter+=10 ))
	[ $counter -eq 100 ] && break
# dealy it a specified amount of time i.e 1 sec
	sleep 1
done
) | 
dialog --title "File Copy" --gauge "Please wait" 7 70 0

clear
