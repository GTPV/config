#! /bin/bash

# command-line options
# -a: install All
# -v: install Vim
# -n: install Neovim
# -t: install Tmux
# -e: install Emacs
# -l: install hyprLand
# -f: install Foot
# -y: say Yes - skip confirmation

skip_confirmation=false

# custom confirmation
confirm() {
	if $skip_confirmation; then
		true
		return
	fi
	read -r -p "$1 - Are you sure? [y/N] " response
	case "$response" in
		[yY][eE][sS]|[yY])
			true ;;
		*)
			false ;;
	esac
}


# install vim
install_vim() {
	if confirm "You are about to install vim config"; then
		echo "installing vim config"
		mv ~/.vimrc ~/.vimrc.bak
		cp ./vim/.vimrc ~/.vimrc
		if confirm "Do you want to install vim-plug?"; then
			echo "installing vim-plug"
			curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
				https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		fi
	fi
}

# install neovim
install_neovim() {
	if confirm "You are about to install neovim config"; then
		echo "installing neovim config"
		mv ~/.config/nvim ~/.config/nvim.bak
		cp -R ./neovim/nvim ~/.config/
		if confirm "Do you want to install packer.nvim?"; then
			echo "installing packer.nvim"
			git clone --depth 1 https://github.com/wbthomason/packer.nvim\
				~/.local/share/nvim/site/pack/packer/start/packer.nvim
		fi
	fi
}

# install tmux
install_tmux() {
	if confirm "You are about to install tmux config"; then
		echo "installing tmux config"
		mv ~/.tmux.conf ~/.tmux.conf.bak
		cp ./tmux/.tmux.conf ~/.tmux.conf
	fi
}

# install emacs
install_emacs() {
	if confirm "You are about to install emacs config"; then
		echo "installing emacs config"
		mv ~/.emacs ~/.emacs.bak
		mv ~/.emacs.d ~/.emacs.d.bak
		cp ./emacs/.emacs ~/.emacs
		cp -R ./emacs/.emacs.d ~/
	fi
}

# install hyprland
install_hyprland() {
	if confirm "You are about to install hyprland config"; then
		echo "installing hyprland config"
		mv ~/.config/hypr ~/.config/hypr.bak
		cp -R ./hypr ~/.config/hypr
	fi
}

# install foot
install_foot() {
	if confirm "You are about to install foot config"; then
		echo "installing foot config"
		mv ~/.config/foot ~/.config/foot.bak
		cp -R ./foot ~/.config/foot
	fi
}

# install all
install_all() {
	echo "install all configs"
	install_vim;
	install_neovim;
	install_tmux;
	install_emacs;
	install_hyprland;
	install_foot;
}

# print help message
print_help() {
	echo "Usage: install.sh -<package>";
	echo "    [-a]: all";
	echo "    [-v]: Vim";
	echo "    [-n]: Neovim";
	echo "    [-t]: Tmux";
	echo "    [-e]: Emacs";
	echo "    [-l]: hyprLand";
	echo "    [-f]: Foot";
}


if [ $# -eq 0 ]; then
	print_help;
	exit 1
fi

while getopts "avntelfyh" opt; do
	case $opt in
		y)
			skip_confirmation=true ;;
	esac
done

OPTIND=1

while getopts "avntelfyh" opt; do
	case $opt in
		a)
			install_all ;;
		v)
			install_vim ;;
		n)
			install_neovim ;;
		t)
			install_tmux ;;
		e)
			install_emacs ;;
		l)
			install_hyprland ;;
		f)
			install_foot ;;
		h)
			print_help
			exit 1 ;;
		\?)
			echo "Invalid option: -$OPTARG" >&2 ;;
	esac
done
