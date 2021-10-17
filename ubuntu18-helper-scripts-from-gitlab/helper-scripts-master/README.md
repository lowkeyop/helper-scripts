# helper-scripts
General helper scripts I've created to help do some of my boring or tedious tasks a smidge faster

I've categorized the various scripts by functionality. All of these scripts were originally created for use with Ubuntu 16, but I've since upgrade to Ubuntu 18 and successfully tested on that version.
So far, I've the dev scripts will make it easy to start up developing with:
Angular
Java
Tomcat
MySQL
PHP
Mongo
Apache Web Server

Note: If running the installJenkins and installApacheTomcat9 shell scripts, there could potentially a configuration issue of both Jenkins and Tomcat attempting to use same port.  Update either Tomcat's or Jenkins' HTTP_PORT value to resolve conflict.  
To modify which port Tomcat runs from, you must modify the /opt/tomcat/confserver.xml file property and change the Connector element's 'port' attribute value to another desired number.
The Jenkins' port number can be changed after Jenkins' have been successfully installed.  After you  startup Jenkins' the first time, you will have an opportunity to update the URL you want to access Jenkins from (including the port number).

As I decide to try to master and learn new technologies, I'm sure I'll add more scripts for easy install.  I like the scripts because they tend to be faster than some GUI interfaces at times. 

If other repository dependencies fail, please let me know.

Hope they helps!  :)
