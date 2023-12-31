#! /bin/bash

# command-line options
# -a: update all
# -v: update vim
# -n: update neovim
# -t: update tmux
# -e: update emacs


# update vim
update_vim() {
    echo "update vim"
	cp ~/.vimrc ./vim/.vimrc
}

# update neovim
update_neovim() {
    echo "update neovim"
	cp -R ~/.config/nvim ./neovim/
}

# update tmux
update_tmux() {
    echo "update tmux"
    cp ~/.tmux.conf ./tmux/.tmux.conf
}

# update emacs
update_emacs() {
    echo "update emacs"
    cp ~/.emacs ./emacs/.emacs
    cp -R ~/.emacs.d ./emacs/.emacs.d
}

# update all
update_all() {
    echo "update all"
    update_vim;
    update_neovim;
    update_tmux;
    update_emacs;
}


if [ $# -eq 0 ]; then
    echo "Usage: update.sh [-a] [-v] [-n] [-t] [-e]"
    exit 1
fi

while getopts "avnte:h" opt; do
    case $opt in
        a)
            update_all ;;
        v)
            update_vim ;;
        n)
            update_neovim ;;
        t)
            update_tmux ;;
        e)
            update_emacs ;;
        h)
            echo "Usage: update.sh [-a] [-v] [-n] [-t] [-e]"
            exit 1 ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2 ;;
    esac
done
