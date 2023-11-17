git clone --bare https://github.com/dshurko/dotfiles.git $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles checkout
dotfiles config status.showUntrackedFiles no
