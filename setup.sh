#!/usr/bin/env sh
#
# Setup everything necessary for usage with a VPS 

apt update -y && apt upgrade -y
apt install foot-terminfo stow tmux vim zsh ufw -y

chsh -s $(which zsh)

test ! -d ${HOME}/.cache/zsh && mkdir -p ${HOME}/.cache/zsh
test ! -d ${HOME}/.config && mkdir -p ${HOME}/.config
test ! -f ${HOME}/.cache/zsh/history && touch ${HOME}/.cache/zsh/history

stow --dotfiles tmux vim zsh

# Deny everything but ssh -- don't f this up or your VPS is gone!
ufw allow ssh
ufw default deny incoming
ufw default allow outgoing
ufw enable
