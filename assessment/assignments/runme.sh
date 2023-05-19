#!/bin/bash
echo "Configuring environment..."
./setvariables.sh
echo "About to install required software..."
echo "Press ENTER to continue."
read
echo ""
echo "***** Installing ansible..."
sudo apt-get install ansible -y
echo ""
echo "***** Installing python libraries..."
echo "Please, provide sudo password..."
ansible-playbook -K requisites.yml
echo ""
echo "***** Installing amazon.aws ansible collection..."
echo ""
ansible-galaxy collection install amazon.aws
echo "***** Installing docker..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" -y
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
echo "***** Ready to start assessment..."
echo ""
echo "Executing Assessment, Assignment 1:"
cd A1
./assignment1.sh
echo "Executing Assessment Assignment 2:"
cd ..
cd A2
./assignment2.sh
cd ..
cd A3
./assignment3.sh
