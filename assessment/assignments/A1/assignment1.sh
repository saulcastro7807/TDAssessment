export ANSIBLE_HOST_KEY_CHECKING=False
echo "This script will execute the tasks in assignment 1"
echo ""
echo "Task 1 will create/provision:"
echo "    * EC2 ssh access key"
echo "    * SSH access private key file"
echo "    * AWS subnet"
echo "    * AWS Security group"
echo "    * AWS EC2 instance with public IP"
echo ""
echo "Task 1: script will run the following command:"
echo "ansible-playbook A1.1.yml"
echo "Press ENTER to execute command"
read
echo "***** BEGIN Command execution output *****"
ansible-playbook A1.1.yml
echo "***** END Command execution output *****"
echo ""
echo "Task 2 will install/execute"
echo "    * Apache http server in remote EC2 instance"
echo "    * SSH forwarding of EC2 remote port 80 to localhost:8080"
echo ""
echo "Task 2: script will run the following commands:"
echo "ansible-playbook -i ./.ansibleinventory.yml A1.2.yml"
echo "Press ENTER to execute command"
read
echo "***** BEGIN Command execution output *****"
ansible-playbook -i ./.ansibleinventory.yml A1.2.yml
echo "***** END Command execution output *****"
echo ""
HOST_IP_ADDR=`head -3 .ansibleinventory.yml | tail -1 | tr -d " :"`
echo "Task 2: script will run the following commands:"
echo "nohup ssh -i .key.pem -N -L 8080:localhost:80 ubuntu@${HOST_IP_ADDR} > output.txt 2>&1 &"
echo "Press ENTER to execute command"
read
nohup ssh -i .key.pem -N -L 8080:localhost:80 ubuntu@${HOST_IP_ADDR} > output1.txt 2>&1 &
echo ""
echo "Now you should be able to open http://localhost:8080/"
echo ""
echo "Task 3: will configure:"
echo "    * SSL certificates for apache"
echo "    * Enable SSL and Rewrite Engine modules for apache"
echo "    * Copy redirect rule configuration file"
echo "    * Restart apache server"
echo ""
echo "Task 3: script will run the following commands:"
echo "ansible-playbook -i ./.ansibleinventory.yml A1.3.yml"
echo "Press ENTER to execute command"
read
echo "***** BEGIN Command execution output *****"
ansible-playbook -i ./.ansibleinventory.yml A1.3.yml
echo "***** END Command execution output *****"
echo ""
echo "Task 23: script will run the following commands:"
echo "nohup ssh -i .key.pem -N -L 8443:localhost:443 ubuntu@${HOST_IP_ADDR} > output.txt 2>&1 &"
echo "Press ENTER to execute command"
read
nohup ssh -i .key.pem -N -L 8443:localhost:443 ubuntu@${HOST_IP_ADDR} > output2.txt 2>&1 &
echo ""
echo "Now you should be able to open https://localhost:8443/"
echo ""
echo "Assignment 1 Script finished"
