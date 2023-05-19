#!/bin/bash
echo "Script to check filesystem utilization, mounting new disk if filesystem over 80% usage"
echo "Press ENTER to start file system check."
read
IFS=$'\n'
export HOST_IP_ADDR=`head -3 .ansibleinventory.yml | tail -1 | tr -d " :"`
RESULT_DU=$( ssh -i .key.pem ubuntu@${HOST_IP_ADDR} "df -h | grep -v 'tmpfs' | tail -n +2 | tr -s ' ' | tr -d "%" | cut -d ' ' -f 5,6")
echo "Checking Filesystem Utilization..."
IFS=$'\n'
for i in $RESULT_DU
do
  fsname=`echo $i | cut -d " " -f 2`
  utilization=`echo $i | cut -d " " -f 1`
  echo "  Fylesystem Name: ${fsname}, % Used: ${utilization}%"
  if [ "$utilization" -lt 80 ]
  then
    echo "    Used space under 80%, no action needed"
  else
    echo "    Used space OVER 80%, new disk needed"
  fi
done
unset IFS
echo ""
echo "This script will create a 300MB file inside /teradata filesystem"
echo "Press ENTER to continue."
read
RANDOM_NUMBER=$(shuf -i 1-1000 -n 1)
ssh -i .key.pem ubuntu@${HOST_IP_ADDR} "sudo fallocate -l 300MB /teradata/test${RANDOM_NUMBER}"
echo "File /teradata/test${RANDOM_NUMBER} (300MB size) created"
echo "About to check filesystems again..."
echo "Press ENTER to continue."
read
echo "Checking Filesystem Utilization..."
RESULT_DU=$( ssh -i .key.pem ubuntu@${HOST_IP_ADDR} "df -h | grep -v 'tmpfs' | tail -n +2 | tr -s ' ' | tr -d "%" | cut -d ' ' -f 5,6")
IFS=$'\n'
for i in $RESULT_DU
do
  fsname=`echo $i | cut -d " " -f 2`
  utilization=`echo $i | cut -d " " -f 1`
  echo "  Fylesystem Name: ${fsname}, % Used: ${utilization}"
  if [ "$utilization" -lt 80 ]
  then
    echo "    Used space under 80%, no action needed"
  else
    echo "    Used space OVER 80%, new disk needed..."
    echo "    About to provision and mount new disk..."
    echo "    Press ENTER to continue..."
    read
    echo ""
    echo "    Running new disk provisioning playbook..."
    ansible-playbook A2.2.yml
    echo "    Running new disk mount (please wait for the disk to be attached first)"
    echo "    Press ENTER to continue..."
    read
    echo ""
    echo "    Running new disk mount task..."
    ansible-playbook -i .ansibleinventory.yml A2.2a.yml
    echo "    Done mounting new disk"
  fi
done
unset IFS
echo ""
