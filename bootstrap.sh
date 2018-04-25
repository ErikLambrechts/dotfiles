#!/usr/bin/env bash

# install missing packaging


cd "$(dirname "${BASH_SOURCE}")";

#git pull origin master;

function install_packages {
	declare -a packages=(
	"git"
	"git-cola"
	"meld"
	"curl"
	"cmake"
	"stow"
	"vim"
	"tmux"
	"zsh"
	"silversearcher-ag"
	"numix-icon-theme"
	"guake"
	"ranger"
	"caca-utils"
	"highlight"
	"atool"
	"w3m"
	"poppler-utils"
	"mediainfo"
	"filezilla"
	"kicad"
	"openscad"
	"blender"
	"pdfmod"
	"texstudio"
	"pip"
	"vlc"
	"calibre"
	"pcb2gcode"
	"entr"
	"xdotool"
	"htop"
	"build-essence"
	"python3-dev"
	)

gawk
translate-shell
meshlab


compizconfig-settings-manager





	## now loop through the above array
	for i in "${packages[@]}"
	do
		echo "================================================================================"
		echo "====================================== $i ======================================"
		echo "================================================================================"
		sudo apt install -y "$i"
	done
}

#function restore_symulink() {
#    #function_body
	# "bcnc"
#}

function install_theme() {
	upt-add-repository ppa:numix/ppa
	sudo apt-get update
	sudo apt-get install numix-icon-theme-circle
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

function intstall_vim(){
	stow vim
	vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
}

function restore_dotfiles() {
	#function_body
	cd dotfiles
	declare -a resorte_config=(
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
	# cd
#	mkdir Documents/Fonts
#	mkdir Software
#	mkdir Projects
#	mkdir Snippets
#	mkdir Screenshots
# }

function doIt() {
	install_packages
	# restore_dotfiles
	# intstall_vim
	# install_theme
#	make_folders
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
