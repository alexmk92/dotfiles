# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alexmk92/.zshrc'

autoload -Uz compinit
autoload -Uz vcs_info
precmd() { vcs_info }
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

zstyle ':vcs_info:git:*' formats 'on branch %b'

compinit
# End of lines added by compinstall

#!/usr/bin/env bash
# This file runs every time you open a new terminal window.
cd $HOME

# Add a timestamp to each command.
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "

# Duplicate lines and lines starting with a space are not put into the history.
export HISTCONTROL=ignoreboth

# Enable asdf to manage various programming runtime versions.
#   Requires: https://asdf-vm.com/#/

# Start SSH agent on session
# source "${HOME}/.ssh/init.sh"

source "$HOME/.cargo/env"

# Export theme to be used by nvim in FZF search
export BAT_THEME="gruvbox-dark"

export PATH="$HOME/local/.bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

[ -f "${HOME}/.aliases" ] && source "${HOME}/.aliases"
[ -f "${HOME}/.asdf/asdf.sh" ] && source "${HOME}/.asdf.sh"
[ -f "${HOME}/.ssh/init.sh" ] && source "${HOME}/.ssh/init.sh"


fpath+=${ZDOTDIR:-~}/.zsh_functions
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

