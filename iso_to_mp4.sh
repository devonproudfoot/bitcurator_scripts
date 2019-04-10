#!/bin/bash

echo "Drag ISO into terminal: "
read ISO

mp4=${ISO/iso/mp4}

HandBrakeCLI -i $ISO
