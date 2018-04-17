#!/usr/bin/env bash

# install missing packaging


cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function install_packages() {
	declare -a packages=(
	"stow"
	"vim"
	"tmux"
	"zsh"
	"ack"
	"numix-icon-theme"
	"quake"
	"ranger caca-utils highlight atool w3m poppler-utils mediainfo"
	"filezilla"
	"kicad"
	"openscad"
	"pdfmod"
	"texstudio"
	"pip"
	"vlc"
	)

	## now loop through the above array
	for i in "${packages[@]}"
	do
		echo "================================================================================"
		echo "====================================== $i ======================================"
		echo "================================================================================"
		sudo apt-get install "$i"
	done
}

#function restore_symulink() {
#    #function_body
	# "bcnc"
#}

function restore_dotfiles() {
	#function_body
	cd dotfiles
	declare -a resorte_config=(
	"vim"
	"tmux"
	"zsh"
	"ranger"
	)

	for i in "${resorte_config[@]}"
	do
		stow $i
	done
}

# function make_folders() {

# }

function doIt() {
	install_packages
	restore_dotfiles
	make_folders
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
