#!/usr/bin/env bash

set -e

echo "Preparing Vim..."
curl -fLo vim/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ""

echo "Preparing Tmux...'"
rm -rf tmux/.tmux
git clone https://github.com/tmux-plugins/tpm tmux/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect.git \
    tmux/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum \
    tmux/.tmux/plugins/tmux-continuum
echo ""

echo "Preparing Zsh..."
mkdir -p zsh/.antigen
curl -L git.io/antigen > zsh/.antigen/antigen.zsh
echo ""

echo "Prepearing Python..."
# 'readline' module for Python 2
sudo apt-get install libncurses5-dev
sudo -H pip2 install readline

echo "Creating symbols links..."
# tmux
ln -sf ${PWD}/tmux/.tmux ${HOME}/.tmux
ln -sf ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf

# vim
ln -sf ${PWD}/vim/.vim ${HOME}/.vim
ln -sf ${PWD}/vim/.vimrc ${HOME}/.vimrc
echo "Use 'PlugInstall' to install Vim plugins"

# zsh
ln -sf ${PWD}/zsh/.antigen ${HOME}/.antigen
ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc

# python
ln -sf ${PWD}/python/.pythonrc ${HOME}/.pythonrc
echo "Use 'echo "export PYTHONSTARTUP=~/.pythonrc" >> ~/.profile' to use it at startup"

