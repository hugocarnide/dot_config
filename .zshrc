# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
#HISTFILE=~/.zsh_history
#SAVEHIST=10000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Plugins for oh my zsh
# plugins=(
# zsh-autosuggestions
# git)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias awssec='$HOME/go/bin/gauth AWS|grep AWS | cut -d " " -f 6'
alias gauth='$HOME/go/bin/gauth'
alias awsvoute='unset AWS_VAULT && aws-vault exec hugo -t $(awssec)'
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias git-amend='git commit --amend --no-edit'
alias git-lease='git push --force-with-lease'
alias git-rebase-it='git rebase origin/main -i'
alias git-continue='git rebase --continue'
alias poetry-login='poetry config http-basic.private_pypi oauth2accesstoken `gcloud config config-helper --format="value(credential.access_token)"` && poetry config http-basic.private_pypi_simple oauth2accesstoken `gcloud config config-helper --format="value(credential.access_token)"`'
export EDITOR='code --wait'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hugoc/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hugoc/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hugoc/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hugoc/bin/google-cloud-sdk/completion.zsh.inc'; fi

bin_path="/home/$USER/bin"
if [[ ":${PATH}:" != *":${bin_path}:"* ]]; then
  export PATH=$bin_path:$PATH:/home/hugoc/bin/google-cloud-sdk/bin
fi
local_bin_path="/home/$USER/.local/bin"
if [[ ":${PATH}:" != *":${local_bin_path}:"* ]]; then
  export PATH=$local_bin_path:$PATH
fi
cargo_bin_path="/home/hugoc/.cargo/bin/"
if [[ ":${PATH}:" != *":${cargo_bin_path}:"* ]]; then
  export PATH=$cargo_bin_path:$PATH
fi




export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(oh-my-posh init zsh --config ~/bin/hotstick.minimal.omp.json)"

#fpath+=~/.zfunc
autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads NVM bash_completion
#source /usr/share/nvm/init-nvm.sh
alias nvm_load='source /usr/share/nvm/init-nvm.sh'
export PATH="$PATH:/home/hugoc/.nvm/versions/node/v20.16.0/bin/"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# To idennfity keys     od -c
# Remove slash from wordchars
WORDCHARS='*?[]~=&;!#$%^(){}<>'
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char


# history setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=1200000
SAVEHIST=1000000

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
alias d4s='docker run --rm --pull always -it -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/jr-k/d4s:latest'
alias studio4='terminator -l studio4'


# Added by Antigravity CLI installer
export PATH="/home/hugoc/.local/bin:$PATH"

# opencode
export PATH=/home/hugoc/.opencode/bin:$PATH
