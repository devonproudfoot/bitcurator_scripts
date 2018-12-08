#!/bin/sh

echo -n "What is the accession number?"
read accession

if [ ! -d "/home/bcadmin/Desktop/pending_transfers/$accession" ]; then
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession
fi

echo -n "What is the unique identifier?"
read unique_id

unique_folder=${accession}_${unique_id}

if [ -d "/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder" ]; then
  echo "Error! Folder already exists!"
  exit
else
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder
fi

dd if=/dev/sdb of=/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.img

floppy_md5=$(md5sum /dev/sdb | cut -d" " -f1)
image_md5=$(md5sum /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.img | cut -d" " -f1)

if [ "$floppy_md5" == "$image_md5" ]
then
  echo "Disk image is valid, go ahead and extract the contents."
else
  echo "WARNING, disk image is not valid please try again!"
fi
