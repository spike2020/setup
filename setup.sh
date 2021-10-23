#!/bin/bash

set -x #echo on


# Systen Update
sudo apt update && sudo apt upgrade -y

# Install basic useful apps
sudo apt install -y vim curl wget nmap tcpdump net-tools htop

# Install ZSH
sudo apt install zsh -y 

#Change default shell to zsh 
chsh -s $(which zsh)

# maybe need to exit shell

# Install oh-my-zsh
# From https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Install custom plugin zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install custom plugin zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Delete the plugis section to replace it
#sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker kubectl history z)/g' ~/.zshrc
sed -i 's/plugins=(git)//g' ~/.zshrc

# Add new settings to .zshrc file
echo -e '\n\n## New Settings ###\n' >> .zshrc
echo -e 'plugins=(\n git\n zsh-syntax-highlighting\n zsh-autosuggestions\n docker\n history\n z\n kubectl\n )\n' >> ~/.zshrc

cat <<EOT >> ~/.zshrc
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=yellow
#history
HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=999999999
export HISTFILESIZE=999999999
#alias
alias myip="curl ifconfig.co"
alias ddu="sudo du -h --max-depth=1 2>/dev/null | sort -hr | head -20"
EOT

# Copy new theme file for better promopt and fix bad chars
cp ~/.oh-my-zsh/themes/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme.backup
cp setup_files/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

# Change manually lines 1,6 for bad chr
#vi ~/.oh-my-zsh/themes/robbyrussell.zsh-theme


# change password
#setup .ssh config
#add public key
# add fail2ban
# change default ssh port
#disable password login
# fc -l 1

##reboot


# Delete orginial and add to the end of the file
sed -i 's/source \$ZSH\/oh-my-zsh\.sh//g' ~/.zshrc
echo -e 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc
