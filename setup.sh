#!/usr/bin/env sh

apt update -y && apt upgrade -y
apt install tmux vim zsh ufw -y

chsh -s $(which zsh)

test ! -d ${HOME}/.cache/zsh && mkdir -p ${HOME}/.cache/zsh
test ! -d ${HOME}/.config && mkdir -p ${HOME}/.config
test ! -f ${HOME}/.cache/zsh/history && touch ${HOME}/.cache/zsh/history

stow --dotfiles tmux vim zsh

# Deny all everything but ssh
ufw allow ssh
ufw default deny incoming
ufw default allow outgoing
ufw enable
