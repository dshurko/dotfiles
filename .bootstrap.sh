git clone --bare git@github.com:dshurko/dotfiles.git $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles checkout
dotfiles config status.showUntrackedFiles no

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew bundle --file=.Brewfile
