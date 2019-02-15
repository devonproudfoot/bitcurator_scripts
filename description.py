 #!/usr/bin/python3
import os, argparse, sys

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('filepath', help='Enter the path to the files to be renamed')
    args = parser.parse_args()
    filepath = args.filepath.strip()
    return filepath

directory = get_args()

for ArchivalObject in os.listdir(directory):
	
