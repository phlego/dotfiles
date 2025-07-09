# brew shellenv is a Homebrew command that outputs shell commands to set up environment variables
# like PATH, MANPATH, and INFOPATH to ensure Homebrew-installed tools (like Git) are accessible.
eval "$(/opt/homebrew/bin/brew shellenv)"
# prioritize Homebrew’s binary directories,
# ensuring tools like Homebrew’s Git are used over system defaults.
export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
# ensures that if a .bashrc file exists in the user’s home directory,
# its contents are loaded into the current Bash session
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# .tokens file contains secrets that should not be committed to source control
if [ -f "$HOME/dotfiles/.tokens" ]; then
    source "$HOME/dotfiles/.tokens"
fi

alias reload='. ~/.bash_profile && echo ".bash_profile has been reloaded ✅"'
# brew install nvim
alias v='nvim'
alias dev='cd /Volumes/Dev/'
# brew install eza
alias list='eza --tree --level=1 --icons'
alias list2='eza --tree --level=2 --icons'
alias list3='eza --tree --level=3 --icons'
alias list4='eza --tree --level=4 --icons'
alias list5='eza --tree --level=5 --icons'
alias path="echo $PATH | tr ':' '\n' | cat -n"

# Helper shell scripts
# export PATH="$PATH:/Volumes/Dev/bin"

# Git
alias gcm='f() { git add . && git commit -m "$1" ; } ; f' # gcm "Your commit message"

# Docker & k8s
alias d='docker'
alias dc='docker compose'
alias k='kubectl'
## short alias to set/show context/namespace (only works for bash and bash-compatible shells, current context to be set before using kn to set namespace)
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'
alias klocal='kx docker-desktop'
alias kport='pf() { [ "$1" ] && kubectl port-forward "$1" "${2:-8080}:${2:-8080}" ; } ; pf'

# Display the current kubectl context in the Bash prompt
# export KUBE_PS1_PREFIX=''
# export KUBE_PS1_SUFFIX=''
# export KUBE_PS1_SEPARATOR=' '
# export KUBE_PS1_DIVIDER=' '
# export KUBE_PS1_NS_COLOR='blue'

# function get_cluster_name() {
#   echo "$1" | rev | cut -d'_' -f1 | rev
# }
# export KUBE_PS1_CLUSTER_FUNCTION='get_cluster_name'
# source '/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh'
# PS1='$(kube_ps1) \w $ '

# Python
# Symlink python to python3: ln -s /opt/homebrew/bin/python3 /opt/homebrew/bin/python
alias p='python3'
alias pip='pip3'
alias pea='workon $(basename $(pipenv --venv))'
alias activate='source .venv/bin/activate'

# Go
# export PATH=$PATH:$(go env GOPATH)/bin

# Common files
alias bashprofile='zed ~/.bash_profile'
alias bashrc='zed ~/.bashrc'
alias zprofile='zed ~/.zprofile'
alias zshrc='zed ~/.zshrc'
alias gitcf='zed ~/.gitconfig'
alias kubecf='zed ~/.kube/config'

# FNM - Fast Node Manager
# eval "$(fnm env --use-on-cd --shell bash)"
# alias n='fnm'

# zoxide is a smarter cd command: https://github.com/ajeetdsouza/zoxide
# brew install zoxide
eval "$(zoxide init --cmd cd bash)"
# fzf is a general-purpose command-line fuzzy finder
# brew install fzf
# Set up fzf key bindings and fuzzy completion
# eval "$(fzf --bash)"

# Added by Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
