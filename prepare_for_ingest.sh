#!/bin/sh

echo -n "Please enter the accession number: "
read accession_number

parent_directory=/home/bcadmin/Desktop/pending_transfers/$accession_number

new_location=/media/sf_backlog/$accession_number

cd /media/sf_backlog/
mkdir $accession_number

cd $parent_directory

for folder in $parent_directory/*
do
	echo $folder
	bagit.py $folder
	rsync -t -c --protect-args -vv --chmod=Fug+rw,o-rwx,Dug+rwx,o-rwx -r $folder $new_location
	new_folder=$(basename $folder)
	cd $new_location
	zip -r $new_location/$new_folder.zip *
	chmod 755 $new_location/$new_folder.zip
	rm -r $new_location/$new_folder
done
