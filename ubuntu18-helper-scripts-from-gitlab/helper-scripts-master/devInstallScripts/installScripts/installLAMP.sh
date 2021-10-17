#!/bin/sh
sudo apt-get update
sudo apt-get install apache2

echo "Checking apache configuration."
echo "Note:  It may state \"AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message \nSyntax OK\""
sudo apache2ctl configtest

echo "Modify the /etc/apache2/apache2.conf file."
read -p " At the bottom, add the following: \nServerName <YOUR_SERVER_DOMAIN_OR_IP> .  Press Enter to continue" i1
sleep 3	
sudo nano /etc/apache2/apache2.conf
echo "Checking Configuration after change..."
sleep 3
sudo apache2ctl configtest
echo "Should  output: \nSyntax OK"
read -p "Restarting Apache2 for changes to take effect. Press Enter to continue" i2
sudo  systemctl restart apache2

echo "A list will appear displaying the available Application profiles for Ubuntu Firewall."
echo "Make sure Apache is in the list.  If not, stop and redo the script"
sudo ufw app list
sleep 3

echo "Information about the \"Apache Full\" app configuration will display."
echo " Make sure the Ports 80 and 443 are enabled"
sudo ufw app info "Apache Full"
sleep 5
echo "Allowing incomming traffic for \"Apache Full\""
sudo ufw allow in "Apache Full"

echo "Installing MySQL Server"
sudo apt-get install mysql-server
echo "Running mysql_secure_installation to improve security.  Allow validate password plugin when prompted to do so. When asked to select the password validation policy, enter 1 (MEDIUM).  Change the password if you desire.  Enter \"Y\" for everything else" 
sleep 10
mysql_secure_installation
echo "MySQL security enhanced"

echo "Installing PHP"
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql

echo "Modify Apache dir.conf to position \"index.php\" as th first DirectoryIndex item in /etc/apache2/cmod-enabled/dir.conf"
sleep 5
echo "Restarting apache2 and checking on the system status"
sudo systemctl restart apache2
sudo systemctl status apache2
echo "Now now showing a list of all available PHP Modules to install.  To install them, enter:\n sudo apt-get install package1 package2 ..."
sleep 10
apt-cache searech php- |less
echo "If you found some package(s) you'd like to install, enter:\n sudo apt-get install package1 package2 ..."
echo "Installation complete. Test your LAMP installation by creating a info.php page.  If unknown how to do so, it's:\n<?php phpinfo(); ?>\nAfterwards, try the page through apache.\nNote infophp() function is a huge security risk.  Promptly remove it once your done your test."
