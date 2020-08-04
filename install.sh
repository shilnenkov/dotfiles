#!/usr/bin/env bash

set -e

echo "Prepare 'Vim'"
curl -fLo vim/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ""

echo "Prepare 'Tmux'"
rm -rf tmux/.tmux
git clone https://github.com/tmux-plugins/tpm tmux/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect.git \
    tmux/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum \
    tmux/.tmux/plugins/tmux-continuum
echo ""

echo "Prepare 'Zsh'"
mkdir -p zsh/.antigen
curl -L git.io/antigen > zsh/.antigen/antigen.zsh
echo ""

echo "Create symbols links"
# stow vim tmux zsh
ln -sf ${PWD}/tmux/.tmux ${HOME}/.tmux
ln -sf ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf

ln -sf ${PWD}/vim/.vim ${HOME}/.vim
ln -sf ${PWD}/vim/.vimrc ${HOME}/.vimrc
echo "Use 'PlugInstall' to install Vim plugins"

ln -sf ${PWD}/zsh/.antigen ${HOME}/.antigen
ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc

