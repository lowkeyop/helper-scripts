import subprocess
import os #this is used to concatenate file path
import subprocess #to envoke the speedtest-cli command
import time #get the timestamp for the file

timeStamp=time.strftime("%m-%d-%Y")

baseDir="/share/data/networkData/"
fileName = "speedTest" + timeStamp + ".json"
filePath = baseDir + fileName

print "Getting speed test data"

if not os.path.exists(baseDir):
	print "creating missing directory to store data"
	os.makedirs(baseDir)

cmd = ["speedtest-cli", "--json", "--share"]

p = subprocess.Popen( cmd, stdout=subprocess.PIPE).communicate()[0]

out = p
f = open( filePath, 'a+')
f.write(p)
f.close()
print out
