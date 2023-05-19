chmod 775 .ansibleinventory.yml .key.pem
cp ../A1/.ansibleinventory.yml ../A1/.instancevar.yml ../A1/.key.pem .
chmod 0400 .ansibleinventory.yml .key.pem
export ANSIBLE_HOST_KEY_CHECKING=False
export HOST_IP_ADDR=`head -3 .ansibleinventory.yml | tail -1 | tr -d " :"`
echo "This script will execute the tasks in assignment 2"
echo ""
echo "Task 1 will create/provision:"
echo "    * EC2 ssh access key"
echo "    * SSH access private key file"
echo "    * AWS volume attached to instance"
echo ""
echo "Task 1: script will run the following command:"
echo "ansible-playbook A2.1.yml"
echo "Press ENTER to execute command"
read
echo "***** BEGIN Command execution output *****"
ansible-playbook A2.1.yml
echo "***** END Command execution output *****"
echo ""
echo "Task 1a will execute"
echo "    * Creation of /teradata mount point in instance"
echo "    * Formatting ext4 fs in new volume"
echo "	  * Configure mount points"
echo "    * mount filesystem"
echo ""
echo "Task 1a: script will run the following command:"
echo "ansible-playbook -i .ansibleinventory.yml A2.1a.yml"
echo "Press ENTER to execute command"
read
echo "***** BEGIN Command execution output *****"
ansible-playbook -i .ansibleinventory.yml A2.1a.yml
echo "***** END Command execution output *****"
echo ""
echo "Task 1b will execute 3 times:"
echo "    * Disk usage check"
echo "    * Create a 300MB file in /teradata"
echo "    * New Disk usage check and provision/mount of new disk, if necessary"
echo ""
echo "Executing disk usage check (1)..."
./diskusage.sh
echo "Executing disk usage check (2)..."
./diskusage.sh
echo "Executing disk usage check (3)..."
./diskusage.sh
echo ""
echo "Task 2 will report:"
echo "    * Remote host kernel name and version"
echo "    * Remote host # of installed packages (and generates a file with the list)"
echo "    * Remote host # of running processes (and generates a file with the list)"
echo ""
./systemreport.sh
