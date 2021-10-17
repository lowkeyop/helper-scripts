#!/bin/bash
#1st argument is base directory, 2nd argument is project name, 3rd and beyond argument is/are component(s) name
BASE_DIR=$1
if [ -z $2 ] ; then
	echo "no arguments provided. 
	Arguments to use:
	1st arg (required) - base directory to create the project at
	2nd arg (required) - project name
	args 3rd or more (optional) - components to create within the project
	example -
	./createNewAngular.sh ./path/to/codingDirectory myProject exampleComponent anotherComponent"
else 
	echo "creating new project" $2
	mkdir -p $BASE_DIR
	cd  $BASE_DIR
	ng new $2
	cd $2
	sudo npm install
fi
for i in "${@:3}"; do
	echo " ng g c $i"
	 ng g c $i
done

