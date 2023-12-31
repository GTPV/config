#! /bin/bash

# command-line options
# -a: backup all
# -v: backup vim
# -n: backup neovim
# -t: backup tmux
# -e: backup emacs

if [ $# -eq 0 ]; then
    echo "Usage: backup.sh [-a] [-v] [-n] [-t] [-e]"
    exit 1
fi

while getopts "a:v:n:t:e:" opt; do
    case $opt in
        a)
            backup_all
            ;;
        v)
            backup_vim
            ;;
        n)
            backup_neovim
            ;;
        t)
            backup_tmux
            ;;
        e)
            backup_emacs
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done

# backup vim
backup_vim() {
	cp ~/.vimrc ./vim/.vimrc
}

# backup neovim
backup_neovim() {
	cp -R ~/.config/nvim ./neovim/
}

# backup tmux
backup_tmux() {
    cp ~/.tmux.conf ./tmux/.tmux.conf
}

# backup emacs
backup_emacs() {
    cp ~/.emacs ./emacs/.emacs
    cp -R ~/.emacs.d ./emacs/.emacs.d
}

# backup all
backup_all() {
    backup_vim
    backup_neovim
    backup_tmux
    backup_emacs
}
