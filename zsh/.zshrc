source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle git-extras
antigen bundle tmux
antigen bundle pip

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle bilelmoussaoui/flatpak-zsh-completion

# Load the theme.
antigen theme win0err/aphrodite-terminal-theme aphrodite

# Tell Antigen that you're done.
antigen apply

# sources, aliases, env variables
source ${HOME}/.tool_aliases.sh

export GDBHISTFILE="${HOME}/.gdb_history"
export PYTHONSTARTUP=~/.pythonrc

alias cbcp="xclip -selection clipboard"

