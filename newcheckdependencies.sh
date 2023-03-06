#!/bin/bash

motiondependencies="/home/DP016707A/pipelineTesting/motiondependencies.txt"
archiva="/data/tools/apache-archiva-2.2.7/repositories/motiondependencies/com/motion"
break="----------------------------"

rm -f $motiondependencies

directories=( "attachment-client" "bat-client" "comm" "ext/commonapps" "credit/credit-client" "credit/credit-library" "credit/credit-service" "credit/service-credit-parent" "framework" "ext/framework-ext" "framework-util" "jdbc" "parameters" "product-list" "redis-cache" "excel" "iiot" )

for dir in "${directories[@]}"
do
    echo "$break$dir$break" >> $motiondependencies
    #ls -lt $archiva/$dir | grep -v "^d" | grep -v "^total" | grep -v "maven*" | head -n 3 >> $motiondependencies
    ls -lt $archiva/$dir | grep -v "^total" | grep -v "maven" | head -n 10 >> $motiondependencies
done

