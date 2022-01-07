#!/usr/bin/env bash

# Install brew
if test ! $(which brew); then
  echo “Installing brew…”
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/thor/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  
  brew analytics off
fi

brew update
brew tap heroku/brew

BREWS=(
  # Jump to folders using a part of the name: https://github.com/wting/autojump
  autojump
  
  # Alternative to `cat`: https://github.com/sharkdp/bat
  bat

  # Github util
  gh

  # Fuzzy finder
  fzf

  # HTTP client alternative to curl https://github.com/jkbrzt/httpie
  httpie

  # Mac App Store CLI: https://github.com/mas-cli/mas
  mas

  # Node version manager
  fnm

  # File watcher from Facebook
  watchman

  heroku

  # Dependency manager for XCode
  cocoapods
)
brew install ${BREWS[@]}

echo 'eval "$(fnm env)"' >> ~/.zprofile
eval "$(fnm env)"

CASKS=(
  # Development tools
  visual-studio-code
  webstorm
  gitup
  docker
  android-studio

  # Browsers
  google-chrome
  firefox

  # Other apps
  1password
  slack
  tidal

  # Set the brightness depending of the time of the day
  flux

  # Window manager
  amethyst

  # Your own wiki
  notion

  # Track your time
  harvest

  # Emails
  superhuman

  # Dev docs
  dash

  # Design
  figma

  java

  # Kdiff 3 for code diffing
  kdiff3

  # Adobe creative cloud
  adobe-creative-cloud
)
brew install --cask ${CASKS[@]}

mas install 497799835 # XCode

# Install fonts
brew tap homebrew/cask-fonts
FONTS=(
  font-roboto
  font-fira-code
  font-meslo-for-powerline
)
brew install --cask ${FONTS[@]}

# Install yarn
npm i -g yarn

# Install global node packages
PACKAGES=(
  expo-cli
  typescript
  eslint
)
yarn global add ${PACKAGES[@]}

echo "VS Code packages…"
CODE_EXTENSIONS=(
  prettier
  eslint
)
code --install-extension ${CODE_EXTENSIONS[@]}

echo "Oh my zsh plugins…"
# Powerlevel 10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Better directory listing with k
git clone https://github.com/supercrabtree/k.git $ZSH_CUSTOM/plugins/k
# Show alias for the command being run
git clone https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips
# Jump between directories with z
git clone https://github.com/rupa/z.git $ZSH_CUSTOM/plugins/z
# Clear terminal when running new commands
git clone https://github.com/Valiev/almostontop.git $ZSH_CUSTOM/plugins/almostontop
# More completions
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# Auto suggestions from history
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
