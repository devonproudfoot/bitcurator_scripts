#!/bin/sh

echo -n "What is the accession number? "
read accession

echo -n "What is the unique identifier? "
read unique_id

echo -n "Drag items into the Terminal that should be copied: "
read input

md5sum input

unique_folder=${accession]_${unique_id}

output=$/media/sf_BC_share/transfers/$accession/$unique_folder

rsync -av --no-perms $source $output

md5sum output

echo "Content has been copied!"
