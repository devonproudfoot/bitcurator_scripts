#!/bin/bash

echo "Drag ISO into terminal: "
read ISO

mp4=${ISO/iso/mp4}

HandBrakeCLI -i $ISO -o $mp4 -e x264 -q 20 -B 160

echo "Done!"
