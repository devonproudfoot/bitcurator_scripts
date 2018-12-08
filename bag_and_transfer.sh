#!/bin/sh

echo -n "Please enter the accession number: "
read accession

python /usr/local/bin/bagit.py /home/bcadmin/Desktop/pending_transfers/$accession

echo -n "Transfering to drive"

rsync -avc /home/bcadmin/Desktop/pending_transfers/$accession /media/sf_backlog

echo -n "Transfer complete"
