#! /bin/bash

# command-line options
# -a: install all
# -v: install vim
# -n: install neovim
# -t: install tmux
# -e: install emacs


# install vim
install_vim() {
    echo "install vim"
    mv ~/.vimrc ~/.vimrc.bak
    cp ./vim/.vimrc ~/.vimrc
}

# install neovim
install_neovim() {
    echo "install neovim"
    mv ~/.config/nvim ~/.config/nvim.bak
    cp -R ./neovim/nvim ~/.config/
}

# install tmux
install_tmux() {
    echo "install tmux"
    mv ~/.tmux.conf ~/.tmux.conf.bak
    cp ./tmux/.tmux.conf ~/.tmux.conf
}

# install emacs
install_emacs() {
    echo "install emacs"
    mv ~/.emacs ~/.emacs.bak
    mv ~/.emacs.d ~/.emacs.d.bak
    cp ./emacs/.emacs ~/.emacs
    cp -R ./emacs/.emacs.d ~/
}

# install all
install_all() {
    echo "install all"
    install_vim;
    install_neovim;
    install_tmux;
    install_emacs;
}


if [ $# -eq 0 ]; then
    echo "Usage: install.sh [-a] [-v] [-n] [-t] [-e]"
    exit 1
fi

while getopts "avnte:h" opt; do
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
