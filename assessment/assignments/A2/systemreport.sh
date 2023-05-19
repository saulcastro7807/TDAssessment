#!/bin/bash
export HOST_IP_ADDR=`head -3 .ansibleinventory.yml | tail -1 | tr -d " :"`
echo "Executing system check..."
echo "Press ENTER to continue."
read
RESULT_KERNEL=$( ssh -i .key.pem ubuntu@${HOST_IP_ADDR} "uname -sr")
$( ssh -i .key.pem ubuntu@${HOST_IP_ADDR} "dpkg -l" > packagelist.txt)
$( ssh -i .key.pem ubuntu@${HOST_IP_ADDR} "ps -aux" > processlist.txt)
NO_PACKAGES=$(tail -n +6 packagelist.txt | wc -l)
NO_PROCESS=$(tail -n +2 processlist.txt | wc -l)
echo "System is running kernel ${RESULT_KERNEL}"
echo "System has ${NO_PACKAGES} packages installed (see full list in packagelist.txt file)"
echo "System has ${NO_PROCESS} running processes (see full list in processlist.txt file)"
