# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aweimeow"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins+=(k)
plugins+=(zsh-syntax-highlighting)

# Zsh Syntax Highlighting Setting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=1'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=14'
ZSH_HIGHLIGHT_STYLES[alias]='fg=10'
ZSH_HIGHLIGHT_STYLES[command]='fg=10'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=10'
ZSH_HIGHLIGHT_STYLES[function]='fg=10'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=15'
ZSH_HIGHLIGHT_STYLES[path]='fg=11'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=11'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=214'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=214'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=214'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=214'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=228'
ZSH_HIGHLIGHT_STYLES[default]='fg=7'

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Fix color in tmux vim
export TERM="xterm-256color"
DISABLE_AUTO_TITLE=true

case $TERM in
    screen*)
        precmd(){
            # Restore tmux-title to 'zsh'
            printf "\033kzsh\033\\"
            # Restore urxvt-title to 'zsh'
            print -Pn "\e]2;zsh:%~\a"
        }
        preexec(){
            # set tmux-title to running program
            printf "\033k$(echo "$1" | cut -d" " -f1)\033\\"
            # set urxvt-title to running program
            print -Pn "\e]2;zsh:$(echo "$1" | cut -d" " -f1)\a"
                }
                ;;
esac

# Fix zsh home & end key working
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line

export PIP_REQUIRE_VIRTUALENV=true
