#! /bin/bash

# command-line options
# -a: update all
# -v: update vim
# -n: update neovim
# -t: update tmux
# -e: update emacs
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

# update vim
update_vim() {
    if confirm "You are about to update vim config"; then
        echo "updating vim config"
        cp ~/.vimrc ./vim/.vimrc
    fi
}

# update neovim
update_neovim() {
    if confirm "You are about to update neovim config"; then
        echo "updating neovim config"
        cp -R ~/.config/nvim ./neovim/
    fi
}

# update tmux
update_tmux() {
    if confirm "You are about to update tmux config"; then
        echo "updating tmux config"
        cp ~/.tmux.conf ./tmux/.tmux.conf
    fi
}

# update emacs
update_emacs() {
    if confirm "You are about to update emacs config"; then
        echo "updating emacs config"
        cp ~/.emacs ./emacs/.emacs
        cp -R ~/.emacs.d ./emacs/
    fi
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
