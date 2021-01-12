#!/usr/bin/env bash

TMUX_CONF="${HOME}/.tmux ${HOME}/.tmux.conf"
VIM_CONF="${HOME}/.vim ${HOME}/.vimrc"
ZSH_CONF="${HOME}/.antigen ${HOME}/zshrc"
PYTHON_CONF="${HOME}/.pythonrc"
GDB_CONF="${HOME}/.gdbinit"

rm -rf ${TMUX_CONF} ${VIM_CONF} ${ZSH_CONF} ${PYTHON_CONF} ${GDB_CONF}

