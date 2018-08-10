# bitcurator_scripts

For use with [BitCurator](http://bitcurator.net/)

by Devon Proudfoot : )

#### Scripts
- audio_disks.sh - Will create a folder for the Audio CD, creating a disk image, relevant metadata, and access wave files

- bag_and_transfer.sh - Uses the [Library of Congress' Python Bagit Script](https://github.com/LibraryOfCongress/bagit-python) to bag an accession and transfer it to Archivematica staging area

- floppy_image.sh - creates a disk image of the floppy and and scans for viruses with ficlam.  NEEDS TO BE TESTED STILL.

- rsync_copy.sh - Copies files off usb/harddrives while retaining file metadata.

#### Outdated Scripts
- create_accessions.sh - Enter the accession number and unique identifier to automatically create folders for the media being transferred.  
