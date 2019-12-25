#!/usr/bin/env bash

# Install brew
if test ! $(which brew); then
  echo “Installing brew…”
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
  hub

  # Fuzzy finder
  fzf

  # HTTP client alternative to curl https://github.com/jkbrzt/httpie
  httpie

  # Mac App Store CLI: https://github.com/mas-cli/mas
  mas

  # Development tools
  yarn

  # Node version manager
  Schniz/tap/fnm

  # File watcher from Facebook
  watchman

  docker-compose

  heroku

  # Dependency manager for XCode
  cocoapods
)
brew install ${BREWS[@]}

CASKS=(
  # Development tools
  visual-studio-code
  gitup
  kitematic
  docker
  android-studio
  pgadmin4

  # Browsers
  google-chrome
  firefox

  # Other apps
  1password
  slack
  spotify

  # Set the brightness depending of the time of the day
  flux

  # Monitor network traffic from apps (and block what you want)
  little-snitch

  # Monitor microphone usage
  micro-snitch

  # Window manager
  amethyst

  # Your own wiki
  notion

  # Track your time
  harvest

  # Emails
  missive

  # Dev docs
  dash

  # Design
  sketch

  java

  # Quicklook in finder
  quicklook-json
  qlmarkdown
  qlstephen
  qlcolorcode

  # Kdiff 3 for code diffing (removed from cask)
  https://raw.githubusercontent.com/Homebrew/homebrew-cask/6a96e5ea44803e52a43c0c89242390f75d1581ab/Casks/kdiff3.rb
)
brew cask install ${CASKS[@]}

mas install 497799835 # XCode
mas install 410628904 # Wunderlist

# Install fonts
brew tap homebrew/cask-fonts
FONTS=(
  font-roboto
  font-fira-code
)
brew cask install ${FONTS[@]}

# Install global node packages
PACKAGES=(
  expo-cli
  typescript
  @vue/cli
  eslint
)
yarn global add ${PACKAGES[@]}

echo "VS Code packages…"
CODE_EXTENSIONS=(
  prettier
  eslint
  vetur # Vue
)
code --install-extension ${CODE_EXTENSIONS[@]}
