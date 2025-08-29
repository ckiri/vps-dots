#!/usr/bin/env sh
#
# Setup everything necessary for using a VPS 

apt update -y && apt upgrade -y
apt install \
    certbot \
    foot-terminfo \
    nginx \
    python3-certbot-nginx \
    rsync \
    stow \
    tmux \
    vim \
    zsh \
    ufw \
    -y

test ! -d ${HOME}/.cache/zsh && mkdir -p ${HOME}/.cache/zsh
test ! -d ${HOME}/.config && mkdir -p ${HOME}/.config
test ! -f ${HOME}/.cache/zsh/history && touch ${HOME}/.cache/zsh/history

stow --dotfiles tmux vim zsh

chsh -s $(which zsh)

# Deny everything but ssh, http & https -- don't f this up or your VPS is gone!
ufw allow ssh
ufw allow http
ufw allow https
ufw default deny incoming
ufw default allow outgoing
ufw enable
