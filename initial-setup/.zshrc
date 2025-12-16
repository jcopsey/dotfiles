alias k=kubectl
alias t=terraform
alias w=windsurf
alias ll="ls -larth"

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

eval "$(ssh-agent -s)"

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Change colors
export ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue
export ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue
export ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enabled vim mode for CLI
set -o vi

eval "$(starship init zsh)"
