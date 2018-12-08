#!/bin/sh

echo -n "Please enter the accession number: "
read accession

echo -n "Please enter the unique identifier: "
read unique_id

echo -n "Creating ISO, please wait"

unique_folder=${accession}_${unique_id}

disk_md5=$(md5sum /dev/sr1 | cut -d" " -f1)

#dd if=/dev/sr0 of=/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.iso
ddrescue -b 2048 -v /dev/sr0 /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.iso /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.log

iso_md5=$(md5sum /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.iso | cut -d" " -f1)

echo -n "Disk MD5: "
echo $disk_md5
echo -n "ISO MD5: "
echo $iso_md5
