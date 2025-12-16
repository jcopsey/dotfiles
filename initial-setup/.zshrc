alias k=kubectl
alias t=terraform
alias w=windsurf
alias ll="ls -larth"

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Created by `pipx` on 2024-09-10 21:57:44
export PATH="$PATH:/Users/jcopsey/.local/bin"

eval "$(ssh-agent -s)"

# Added by Windsurf
export PATH="/Users/jcopsey/.codeium/windsurf/bin:$PATH"

#eval "$(starship init zsh)"

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

set -o vi

eval "$(starship init zsh)"
