#!/bin/sh

echo -n "Please enter the accession number: "
read accession

echo -n "Please enter the unique identifier: "
read unique_id

echo -n "Creating ISO, please wait"

unique_folder=${accession}_${unique_id}

disk_md5=$(md5sum /dev/sr1 | cut -d" " -f1)

ddrescue /dev/sr1 /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.iso

iso_md5=$(md5sum /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.iso | cut -d" " -f1)

echo -n "Disk MD5: "
echo $disk_md5
echo -n "ISO MD5: "
echo $iso_md5

if ["$disk_md5" -eq "$iso_md5" ]; then
	echo -n "Image is valid!"
	echo -n "Creating MP4 file, please wait"
	HandBrakeCLI -i /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.iso -o /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.mkv
else
	echo - m "ERROR: Image is NOT valid!"
fi







