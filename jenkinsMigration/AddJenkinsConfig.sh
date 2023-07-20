#!/bin/bash

# Define the source directories to be tarred
source_directories=(
    "/home/DP016707A/jenkinsMigration/jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml"
)

target_directory="/data/jenkinsHome/"


for dir in "${source_directories[@]}"; do 
    echo "Location of migrated file: $dir"
    dirname=$(basename "$dir")
    echo "File name: $dirname"

    chownDir="$target_directory$dirname"
    echo "Plugin directory location: $chownDir"
    cp "$dir" "$target_directory"
    chown jenkins:jenkins "$chownDir"
    chmod 644 "$chownDir"
    

done

systemctl restart jenkins
systemctl status jenkins