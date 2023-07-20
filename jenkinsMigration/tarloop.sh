#!/bin/bash

mapfile -t source_directories < directories.txt

# Define the source directories to be tarred
#source_directories=(
#    "/data/jobs/MotionMobile-PROD-Build-Linux/"
#    "/data/jobs/MotionMobile-PROD-Build-Inenco/"
#    "/data/jobs/MotionMobile-Motion-Websphere-development/"
#    "/data/jobs/MotionMobile-Motion-PREPROD-QAT/"
#    "/data/jobs/MotionMobile-Motion-dynamic-development/"
#    "/data/jobs/MotionMobile-Inenco-PREPROD-QAT/"
#    "/data/jobs/MotionMobile-Inenco-dynamic-development/"
#    "/data/jobs/MotionMobile-Build-Linux-Ionic/"
#)


# Define the target directory where the tarballs will be stored
target_directory="/home/DP016707A/jenkinsMigration"

#Create directory if it does not exist
mkdir -p "$target_directory"

#Loop through the source directories and create tarballs
for dir in "${source_directories[@]}"; do 
    #Extract the directory name from the path
    dirname=$(basename "$dir")

    #Create the tarbal filename
    tarball="$target_directory/$dirname.tar.gz"

    #tar and gzip the directory
    tar -czvf "$tarball" -C "$(dirname "$dir")" "$(basename "$dir")" --exclude="$dirname/builds" --exclude="$dirname/promotions"

    echo "Created tarball: $tarball"
done
