#!/bin/sh

echo "Installing Jenkins"
echo "Force installing Java JDK 8 just in case Java is not already installed (Note: Jenkins won't work with JDK 9 or better)..."
sleep 3
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

echo "Adding Jenkins repository key"
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
read -p "Update the HTTP_PORT value to not conflict with any other applications that may be running on the default port number 8080. Press enter to continue:" waitInput
sudo nano -c /etc/default/jenkins
