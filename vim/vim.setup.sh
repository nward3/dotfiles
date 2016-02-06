#!/bin/bash

# original from lkgarrison
# modified by nward

# Setup Vundle (Plugin Manager)
vundle_repo="https://github.com/VundleVim/Vundle.vim.git"
vundle_dir="~/.vim/bundle/"
vundle_file="~/.vim/bundle/Vundle.vim"

# Clone Vundle Plugin Manager if it wasn't already
if [ ! -e $(eval echo $vundle_file) ]
then
	eval git clone "$vundle_repo" "$vundle_dest$vundle_file"
fi

# Install plugins specified in .vimrc
eval "vim +PluginInstall +qall"

# copy .colors files into .vim/colors/
monokai_colors_file=${vundle_dir}"vim-monokai/colors/monokai.vim"
vim_colors_dir="~/.vim/colors/"

# jump through hoops for tilde expansion
if [ -e $(eval echo $monokai_colors_file) ]
then
	# create vim colors directory if it doesn't exist
	if [ ! -d $(eval echo $vim_colors_dir) ]
	then
		echo Making new directory: $vim_colors_dir
		eval mkdir $vim_colors_dir
	fi

	# copy monokai colors file into vim colors dir
	echo Copying Monokai colors into proper VIM colors directory
	eval cp "$monokai_colors_file $vim_colors_dir"
else
	echo ERROR: Monokai colors do not exist. Check .vimrc for correct plugin.
fi
