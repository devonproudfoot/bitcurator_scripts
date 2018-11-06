#!/bin/sh

###I DON'T KNOW IF THIS WORKS

accession=$(zenity --entry --title="Transfer Information" --text="What is the accession number?")

if [ ! -d "/home/bcadmin/Desktop/pending_transfers/$accession" ]; then
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession
fi

unique_id=$(zenity --entry --title="Transfer Information" --text="What is the unique identifier?")
unique_folder=${accession}_${unique_id}

if [ -d "/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder" ]; then
  zenity --info --title="Error" text="Folder already exists!"
  exit
else
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder
fi

mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/media_photographs

zenity --info --title="Folder Created" text="The folders has been created for $unique_folder"

#create disk image

image_date=$(date +"%Y-%m-%d-%T")

find /usr | zenity --progress --pulsate --auto-close --auto-kill --text="Please wait while a disk image is created..."

image_file=/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_id.img

sudo dd if=/dev/sdb of=$image_file

### MUST HAVE FICLAM.SH from SLEUTHKIT [https://github.com/sleuthkit/sleuthkit/blob/develop/tools/fiwalk/plugins/ficlam.sh]

find /usr | zenity --progress --pulsate --auto-close --auto-kill --text="Please wait while the disk image is scanned for viruses..."

cd /usr/share/sleuthkit/tools/fiwalk/plugins/

sudo ficlam -c clamconfig.txt -X/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/metadata/ $image_file

zenity --info --title="Complete!" --text="Please make sure to check the virus scan xml document in the metadata folder before the accession is transfered!"
