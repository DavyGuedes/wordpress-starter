#!/bin/bash

build=".env.dev" # defaul value
read -p "Is this a production build? [y/n]: " yn
# echo "Hi $yn!"
if [ "$yn" = "y" ] ; then
	echo "Building with PRODUCTION environment.";
	build=".env.prod"
	echo "Did you set the .env.prod file correctly?";
else
	if [ "$yn" = "n" ] ; then
		echo "Building with DEVELOPMENT environment. Don't go to production!";
	else 
		echo "invalid"
	fi
fi

source $build; rm -rf docker-compose.yml; envsubst < "template.yml" > "docker-compose.yml"; 