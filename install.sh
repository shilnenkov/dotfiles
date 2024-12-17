#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(dirname $(readlink -f ${0}))"

echo "Preparing Vim..."
curl -fLo "${SCRIPT_DIR}/vim/autoload/plug.vim" --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Preparing Tmux...'"
rm -rf "${SCRIPT_DIR}/tmux/plugins"
git clone https://github.com/tmux-plugins/tpm \
    "${SCRIPT_DIR}/tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tmux-resurrect.git \
    "${SCRIPT_DIR}/tmux/plugins/tmux-resurrect"
git clone https://github.com/tmux-plugins/tmux-continuum \
    "${SCRIPT_DIR}/tmux/plugins/tmux-continuum"

echo "Installing oh-my-zsh..."
export ZSH="${SCRIPT_DIR}/zsh/oh-my-zsh"
rm -rf "${ZSH}"
curl -fLo /tmp/install.sh --create-dirs \
     https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh /tmp/install.sh --unattended

echo "Installing custom zsh plugins..."
rm -rf "${ZSH}/custom/plugins/zsh-autosuggestions"
rm -rf "${ZSH}/custom/plugins/zsh-completions"
rm -rf "${ZSH}/custom/plugins/zsh-syntax-highlighting"

git clone --quiet https://github.com/zsh-users/zsh-autosuggestions \
   "${ZSH}/custom/plugins/zsh-autosuggestions"
git clone --quiet https://github.com/zsh-users/zsh-completions \
    "${ZSH}/custom/plugins/zsh-completions"
git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting \
    "${ZSH}/custom/plugins/zsh-syntax-highlighting"

echo "Installing aphrodite theme..."
rm -rf /tmp/aphrodite-terminal-theme
git clone --quiet https://github.com/win0err/aphrodite-terminal-theme \
   /tmp/aphrodite-terminal-theme
cp /tmp/aphrodite-terminal-theme/aphrodite.zsh-theme \
   "${ZSH}/custom/themes/aphrodite.zsh-theme"

echo "Creating symbols links..."
# tmux
ln -sf ${SCRIPT_DIR}/tmux ${HOME}/.tmux
ln -sf ${SCRIPT_DIR}/tmux/tmux.conf ${HOME}/.tmux.conf
# vim
ln -sf ${SCRIPT_DIR}/vim ${HOME}/.vim
ln -sf ${SCRIPT_DIR}/vim/vimrc ${HOME}/.vimrc
echo "Use 'PlugInstall' to install Vim plugins"
# zsh
ln -sf ${SCRIPT_DIR}/zsh/zshrc ${HOME}/.zshrc
#gdb
ln -sf ${SCRIPT_DIR}/gdb/.gdbinit ${HOME}/.gdbinit

