#!/usr/bin/env bash
# This file runs every time you open a new terminal window.
cd $HOME

# Limit number of lines and entries in the history. HISTFILESIZE controls the
# history file on disk and HISTSIZE controls lines stored in memory.
export HISTFILESIZE=50000
export HISTSIZE=50000

# Add a timestamp to each command.
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "

# Duplicate lines and lines starting with a space are not put into the history.
export HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Ensure $LINES and $COLUMNS always get updated.
shopt -s checkwinsize

# Enable bash completion.
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Improve output of less for binary files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Load aliases if they exist.
[ -f "${HOME}/.aliases" ] && source "${HOME}/.aliases"
[ -f "${HOME}/.aliases.local" ] && source "${HOME}/.aliases.local"

# Determine git branch.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set a non-distracting prompt.
PS1='\[[01;32m\]\u@\h\[[00m\]:\[[01;34m\]\w\[[00m\] \[[01;33m\]$(parse_git_branch)\[[00m\]\$\n'

# If it's an xterm compatible terminal, set the title to user@host: dir.
case "${TERM}" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]${PS1}"
    ;;
*)
    ;;
esac

# Enable asdf to manage various programming runtime versions.
#   Requires: https://asdf-vm.com/#/
source "${HOME}"/.asdf/asdf.sh
source "${HOME}"/.asdf/completions/asdf.bash

# Start SSH agent on session
source "${HOME}/.ssh/init.sh"

# Enable a better reverse search experience.
#   Requires: https://github.com/junegunn/fzf (to use fzf in general)
#   Requires: https://github.com/BurntSushi/ripgrep (for using rg below)
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--color=dark"
[ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"

# WSL 2 specific settings.
if grep -q "microsoft" /proc/version &>/dev/null; then
    # Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
    export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"
    # OpenGL
    export LIBGL_ALWAYS_INDIRECT=1

    # Allows your gpg passphrase prompt to spawn (useful for signing commits).
    export GPG_TTY=$(tty)
fi

# WSL 1 specific settings.
if grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
    if [ "$(umask)" = "0000" ]; then
        umask 0022
    fi

    # Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
    export DISPLAY=:0
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# checks to see if we are in a windows or linux dir
function isWinDir {
  case $PWD/ in
    /c/*) return $(true);;
    *) return $(false);;
  esac
}

# wrap the git command to either run windows git or linux
function git {
  if isWinDir
  then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}

# Disable CTRL+S interpret so it doesn't perform a scroll lock
stty -ixon
source "$HOME/.cargo/env"

# Export theme to be used by nvim in FZF search
export BAT_THEME="gruvbox-dark"

# Use bash completion if available.
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

export PATH="$HOME/local/.bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
. "$HOME/.cargo/env"

source ~/.bash_completion
