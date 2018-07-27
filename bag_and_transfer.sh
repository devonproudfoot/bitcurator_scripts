#!/bin/sh

accession=$(zenity --entry --title="Bag and Transfer" --text="Please enter the accession number: ")

python /usr/local/bin/bagit.py /home/bcadmin/Desktop/pending_transfers/$accession

rsync -r -t -p -o -g -v --progress - c -D -s /home/bcadmin/Desktop/pending_transfers/$accession /media/sf_BC_share/transfers

zenity --info --title="Transfer Complete" --text="The transfer was successful \n\n Please find the material in the 'Transfers' folder."
