#!/bin/bash


# Création de vagrant
sudo apt-get install vagrant


# Création de virtualbox
sudo apt-get install virtualbox

vagrant init

# Demande de choisir entre 2 box
read -p "Que choisissez vous comme box?
	1 - xenial64
	2 - trusty64" reponse;
read reponse;	


if [ $reponse -eq 1 ]  
then
	box1="ubuntu\/xenial64";
	sed -i -e "s/config.vm.box = \"base\"/config.vm.box = \"$box1\"/g" Vagrantfile;

elif [ $reponse -eq 2 ]
then
	box2="ubuntu\/trusty64";
	sed -i -e "s/config.vm.box = \"base\"/config.vm.box = \"$box2\"/g" Vagrantfile;
	

read -p "Saisissez le nom du dossier 'data' : " dossier;
read -p "Saisissez le chemin (ex: /var/www/html) : " chemin;
sed -i -e "s=config.vm.synced_folder \"..\/data\", \"\/vagrant_data\"=config.vm.synced_folder \"$dossier\", \"$chemin\"=g" Vagrantfile;

 vagrant up;
 vagrant ssh;



 echo "voici la liste de toutes les Vagrant en cours d'utilisation";
 read "vagrant box list";

fi

