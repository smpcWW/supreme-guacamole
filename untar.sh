#!/bin/bash

# Define the source directories to be tarred
source_directories=(
"jenkinsMigration/Supplier-Connectivity-Prod.tar.gz"
"jenkinsMigration/Supplier-Connectivity-Prod-backup.tar.gz"
"jenkinsMigration/Supplier-Connectivity-Prod-backupb4BLMOTPDMIWEB11sremoval.tar.gz"
"jenkinsMigration/Supplier-Connectivity-Prod-JeffTest.tar.gz"
"jenkinsMigration/Supplier-Connectivity-QAT.tar.gz"
"jenkinsMigration/SupplierIM-Build-Linux-development.tar.gz"
"jenkinsMigration/SupplierIM-Build-release-QAT-bkup22-05-11.tar.gz"
"jenkinsMigration/SupplierIM-PREPROD-QAT.tar.gz"
"jenkinsMigration/SupplierIM-PROD-Build-Linux.tar.gz"
"jenkinsMigration/SupplierPortal-PROD-Build-Linux.tar.gz"
"jenkinsMigration/Testing Jenkins TLSv1.2 connection.tar.gz"
"jenkinsMigration/TestingWarFileVersion.tar.gz"
"jenkinsMigration/TestingWarFileVersion1.tar.gz"
"jenkinsMigration/VIMS-development-SNAPSHOT.tar.gz"
"jenkinsMigration/VIMS-PREPROD-QAT.tar.gz"
"jenkinsMigration/VIMS-PROD-Linux.tar.gz"
"jenkinsMigration/WebSphere-Check-Server-Dev.tar.gz"
"jenkinsMigration/WebSphere-Deploy-MiPro-Dev.tar.gz"
"jenkinsMigration/WebSphere-Dynamic-Script-eCOS.tar.gz"
"jenkinsMigration/WebSphere-Dynamic-Script-Inenco.tar.gz"
"jenkinsMigration/WebSphere-Dynamic-Script-MIPro.tar.gz"
)

target_directory="/data/jenkinsHome/jobs"

for dir in "${source_directories[@]}"; do 
    dirname=$(basename "$dir")
    tar -xvf "$dir" -C /data/jenkinsHome/jobs/

done