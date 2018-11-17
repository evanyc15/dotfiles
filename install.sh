#!/user/bin/env bash

# Check If Dependencies Are Installed
which fc-cache >/dev/null || { # check if fc-cache is in our path
	echo "fc-cache not found in path..."
	brew install fontconfig
}

which git >/dev/null || { # check if git is in our path
	echo "git not found in path..."
	exit 1
}


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

echo "\nBrewInstall plugins"
brew install tmux
brew install cmake

echo "\nPlugInstall to install plugins"
vim +'PlugInstall --sync' +qa

# Install Powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Update Font Cache
fc-cache -vrf ~/.fonts

# Init Bash Profile
echo "\nInitializing Bash Profile"
. ~/.bash_profile

echo "\nInstallation complete"

