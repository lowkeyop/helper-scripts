#!/bin/sh
echo "Script for installing Apache Tomcat 7
FIrst, making sure all your current software is up to date before continuing.  Forcing all updates."
echo "Force installing cURL first"
sudo apt-get install curl -y
sudo apt-get update -y

echo "Installing Java 11 JDK"
sudo apt install default-jdk -y

echo"Create Tomcat User
Creating tomcat group"
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

echo "Downloading tomcat tar file"
cd /tmp
curl -O http://apache.mirrors.hoobly.com/tomcat/tomcat-9/v9.0.37/bin/apache-tomcat-9.0.37.tar.gz

echo "Creating tomcat directory"
sudo mkdir /opt/tomcat/
sudo tar xzvf apache-tomcat-9.0.37.tar.gz -C /opt/tomcat --strip-components=1

echo "Updating permissions"
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/

echo "Setting up Tomcat as a service"
read -p "create a tomcat service file using the following command:
sudo nano /etc/systemd/system/tomcat.service

-------Copy and Paste the content below-------
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
-------End of Copy and Paste the content-------

Save the tomcat.service file in the /etc/systemd/system directory

AFter you've saved the file, press Enter" input1
sudo echo "-------Copy and Paste the content below-------
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/tomcat.service
echo "Reloading systemd daemon"
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl status tomcat
echo "Adjusting Firewall"
sudo ufw allow 8080
echo "Firewall Adjustment Done"
sleep 5
read -p "Take a moment to check that you can successfully connect to the tomcat service
Using a web browser, check the following url:
http://localhost:8080
You should be able to see the Tomcat landing page.  If you were able to see the landing page successfully, Press Enter" input2
sudo systemctl enable tomcat
echo "Configuring Tomcat Web Manager Interface"
read -p "We need to add a user to the Tomcat user who can access the different Tomcat GUIs.  (changing the username and passsword values as needed) Add the following 'user' sub-element to the 'tomcat-users' element in the following file:

sudo nano /opt/tomcat/conf/tomcat-users.xml


 <user username=\"admin\" password=\"password\" roles=\"manager-gui,admin-gui\"/>
Press Enter to display the context.xml file.  Once in, insert the user element into  the tomcat-users parent element.

" input3

read -p "In files:
/opt/tomcat/webapps/manager/META-INF/context.xml 
/opt/tomcat/webapps/host-manager/META-INF/context.xml

sudo nano /opt/tomcat/webapps/manager/META-INF/context.xml 
sudo nano /opt/tomcat/webapps/host-manager/META-INF/context.xml
comment out the restrictions on IPs in the Context section:

<Context antiResourceLocking=\"false\" privileged=\"true\" >
  <!--<Valve className=\"org.apache.catalina.valves.RemoteAddrValve\"
         allow=\"127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1\" />-->
</Context>
Hit Enter to continue" input4
sudo systemctl restart tomcat
echo "Restarted service. Changes have taken effect. Check Tomcat from your web browser."
