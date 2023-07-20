#!/bin/bash

# Define the source directories to be tarred
source_directories=(
"/home/DP016707A/jenkinsMigration/MotionMobile-Build-Linux-Ionic.tar.gz"
"/home/DP016707A/jenkinsMigration/MotionMobile-Inenco-dynamic-development.tar.gz"
"/home/DP016707A/jenkinsMigration/MotionMobile-Inenco-PREPROD-QAT.tar.gz"
"/home/DP016707A/jenkinsMigration/MotionMobile-Motion-dynamic-development.tar.gz"
"/home/DP016707A/jenkinsMigration/MotionMobile-Motion-PREPROD-QAT.tar.gz"
"/home/DP016707A/jenkinsMigration/MotionMobile-Motion-Websphere-development.tar.gz"
"/home/DP016707A/jenkinsMigration/MotionMobile-PROD-Build-Inenco.tar.gz"
"/home/DP016707A/jenkinsMigration/MotionMobile-PROD-Build-Linux.tar.gz"
)

target_directory="/data/jenkinsHome/jobs"

for dir in "${source_directories[@]}"; do 

    tar -xvf "$dir" -C /data/jenkinsHome/jobs/

done