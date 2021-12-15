#!/bin/sh

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

install_zsh() {
    # https://stackoverflow.com/a/8597411
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command_exists nix; then
            # Installing zsh on nixos
            nix profile install nixpkgs#zsh
        elif command_exists apt-get; then
            # Installing zsh on debian like
            apt-get install -y zsh
        fi
    #elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        # zsh is the default shell out of the box
    fi
}

# Install ZSH if not present
if ! command_exists zsh; then
    install_zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "$HOME/.dot-files" ]; then
    git clone https://github.com/thibaultjunin/dot-files.git "$HOME/.dot-files"
else
    cd "$HOME/.dot-files"
    git pull
    cd -
fi

# TODO: Add alias and other configuration files

touch ~/.env_installed

# Launching zsh
zsh
