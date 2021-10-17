#!/bin/bash
# Argument one: root of Angular project directory
# Argument two: component name you want to add.  Include directory path as well if you do not want it in the default location.
cd $1
for i in "${@:2}"; do
	echo " ng g c $i"
	 ng g c $i
done