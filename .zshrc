# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Use fnm for node versions
eval "`fnm env`"

# No telemetry for yarn
yarn config set --home enableTelemetry 0

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" # old one: spaceship

plugins=(k z almostontop docker docker-compose node npm)
plugins+=(zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR="code"

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

############### ALIASES ###############
# List all files colorized in long format
alias ll="ls -lFG"

# List all files colorized in long format, including dot files
alias la="ls -laFG"

# List only directories
alias lsd="ls -lFG | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls -G"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

alias prof="$EDITOR ~/.zshrc"
alias reprof="source ~/.zshrc"

# Git aliases
alias gl="git pull"
alias gp="git publish"
alias gco="git checkout"

alias grow="pipenv run grow"

alias wstorm="open -a /Applications/WebStorm.app"

andev() {
  adb -s "$1" reverse tcp:8081 tcp:8081
}

# Ruby
export PATH="$PATH:/usr/local/opt/ruby/bin"

# Android Studio
export ANDROID_HOME="/Users/aegir/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Auto load node version with fnm
autoload -U add-zsh-hook
_fnm_autoload_hook() {
	if [[ -f .nvmrc && -r .nvmrc || -f .node-version && -r .node-version ]]; then
		fnm use
	fi
}

add-zsh-hook chpwd _fnm_autoload_hook

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
