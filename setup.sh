#!/usr/bin/env bash

xcode-select --install

# Oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Configuring OS…"
source ".macos"

echo "Installing apps…"
source "apps.sh"

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	ln -sfv "$PWD/.gitconfig" ~/.gitconfig
	ln -sfv "$PWD/.gitignore" ~/.gitignore
	ln -sfv "$PWD/.zshrc" ~/.zshrc
	source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;