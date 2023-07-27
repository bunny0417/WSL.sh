#!/bin/bash
export PATH="$HOME/.local/bin:$PATH"
# Install dependencies
sudo apt -y install wget git zsh

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" <<< "n"

# Modify the Zsh configuration file
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/; s/ZSH_THEME="robbyrussell"/ZSH_THEME="simple"/' "$HOME/.zshrc"

# Create the custom plugins directory
mkdir -p "$HOME/.oh-my-zsh/custom/plugins"

# Clone Zsh autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

# Change ownership of the plugin directory
sudo chown -R "$USER" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

# Change the default shell for the 'bunny' user to Zsh
sudo chsh -s /usr/bin/zsh bunny

# Recon FTW
git clone https://github.com/six2dez/reconftw.git
cd reconftw/
./install.sh <<< "1"
