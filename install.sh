#!/user/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "\nCreating symlinks..."
ln -sfv "$DOTFILES_DIR/.bash_profile" $HOME/.bash_profile
ln -sfv "$DOTFILES_DIR/.vimrc" $HOME/.vimrc
ln -sfv "$DOTFILES_DIR/.vim/" $HOME

echo "\nGit cloning base16 colors for shell"
CLONE_DIR="$HOME/.config/base16-shell"
if [ ! -d "$CLONE_DIR" ]; then
        git clone https://github.com/chriskempson/base16-shell.git "$CLONE_DIR"
fi

echo "\nPlugInstall to install plugins"
vim +'PlugInstall --sync' +qa

echo "\nBrewInstall plugins"
brew install tmux

# Init Bash Profile
echo "\nInitializing Bash Profile"
. ~/.bash_profile

echo "\nInstallation complete"

