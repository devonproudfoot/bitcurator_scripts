#!/bin/bash

echo -n "Please enter the collection ID (no spaces): "
read coll_ID

while true; do
	echo -n "Would you like to create a SIP (y/n) "
	read choice
	if [ "$choice" == 'n' ]
    then
        exit 1
	fi
	echo -n "Please enter the series and item name (ex. 'Photographs--Basketball'): "
	read SIP
	mkdir /home/bcadmin/Desktop/working/$coll_ID--$SIP
	mkdir /home/bcadmin/Desktop/working/$coll_ID--$SIP/objects
	mkdir /home/bcadmin/Desktop/working/$coll_ID--$SIP/metadata
    touch /home/bcadmin/Desktop/working/$coll_ID--$SIP.txt
    open /home/bcadmin/Desktop/working/$coll_ID--$SIP.txt
	xdg-open /home/bcadmin/Desktop/working/$coll_ID--$SIP.txt
    read -p "The text file has been opened, please copy the paths to the records to be included in the SIP.  Each folder or file should be be on a new line.  Hit enter when the file has been saved."
    while IFS='' read -r line || [[ -n "$line" ]]; do
        echo $line
        rsync -t -c --protect-args -vv --chmod=Fug+rw,o-rwx,Dug+rwx,o-rwx -r "$line" /home/bcadmin/Desktop/working/$coll_ID--$SIP/objects
    done < "/home/bcadmin/Desktop/working/$coll_ID--$SIP.txt"
	rm /home/bcadmin/Desktop/working/$coll_ID--$SIP.txt
	#bagit.py --md5 /home/bcadmin/Desktop/working/$coll_ID--$SIP
	#chmod -R 755 /home/bcadmin/Desktop/working/$coll_ID--$SIP
done
