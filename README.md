# dotfiles

# NOTE: If powerline symbols are not showing up, make sure that in iTerm2, the font is set to Space Mono for Powerline (or any font with Powerline in it)
# Tmux upon iTerm start: tmux ls && read tmux_session && tmux attach -t ${tmux_session:-default} || tmux new -s ${tmux_session:-default}

## VIM / iTerm Configurations
### Packages
* base16 colors shell/vim
* airline w/ themes

For tmux, if the colors aren't showing up, make sure to put the following into ~/.bashrc:
export TERM="xterm-256color"

## Installation
sh install.sh for installation
