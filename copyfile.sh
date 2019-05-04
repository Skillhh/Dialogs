#!/bin/bash
# filename: iso.py

counter=0

#ORG="/home/skill/Downloads/DAG.rar"
ORG="/home/"
DEST="/home/"

while :
do	
	(( counter+=1))

cat <<EOF
XXX
$counter
Copy file... ($counter%)
XXX
EOF
	
	cp ${ORG} ${DEST} &>/dev/null

#((counter+=0))
[ $counter -eq 100 ] && break

done | dialog --title "Copy File" --clear --gauge "Please wait" 10 70 0
