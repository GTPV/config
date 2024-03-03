#! /bin/bash

# command-line options
# -a: install all
# -v: install vim
# -n: install neovim
# -t: install tmux
# -e: install emacs
# -y: skip confirmation

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
    if confirm "Your are about to install neovim config"; then
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
    if confirm "Your are about to install tmux config"; then
        echo "installing tmux config"
        mv ~/.tmux.conf ~/.tmux.conf.bak
        cp ./tmux/.tmux.conf ~/.tmux.conf
    fi
}

# install emacs
install_emacs() {
    if confirm "Your are about to install emacs config"; then
        echo "installing emacs config"
        mv ~/.emacs ~/.emacs.bak
        mv ~/.emacs.d ~/.emacs.d.bak
        cp ./emacs/.emacs ~/.emacs
        cp -R ./emacs/.emacs.d ~/
    fi
}

# install all
install_all() {
    echo "install all configs"
    install_vim;
    install_neovim;
    install_tmux;
    install_emacs;
}


if [ $# -eq 0 ]; then
    echo "Usage: install.sh [-a] [-v] [-n] [-t] [-e]"
    exit 1
fi

while getopts "avnteyh" opt; do
    case $opt in
        y)
            skip_confirmation=true ;;
    esac
done

OPTIND=1

while getopts "avnteyh" opt; do
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
        h)
            echo "Usage: install.sh [-a] [-v] [-n] [-t] [-e]"
            exit 1 ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2 ;;
    esac
done
