#! /bin/sh
read -p "Hello, We're about to map some network drives to this server.  Enter 'yes'  to continue: " input
if [ $input = "yes" ]; then
	echo "continuing with installation"
	read -p "Please provide the directory path where you'd like to reach your mapped drive:"  mapPath
	sudo apt-get install cifs-utils -y
	sudo mkdir -p $mapPath
	echo "$mapPath is present"
	echo "edit your /etc/fstab file (with root privileges) to add this line:

//<servername>/<sharename>  $mapPath  cifs  guest,uid=1000,iocharset=utf8  0  0
Replace  <servername> with either the IP address or the alias where your network drive is located.  Replace <sharename> with the path to the drive that you want to mount from.
if you have multiple network drive maps you'd like to add, add each on an indivual line. Also be sure to add each directory path specified in your fstab file on your system.

Save the file, exit the editor.
"
read -p "After editing your fstab file, hit Enter to continue. Specified mount points in fstab file will be mounted" waitInput
sudo mount -a
fi

