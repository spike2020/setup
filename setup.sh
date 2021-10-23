#!/bin/bash

set -x #echo on

# Systen Update
sudo apt update && sudo apt upgrade -y

# Install basic useful apps
sudo apt install -y vim curl wget nmap tcpdump net-tools htop

# Install ZSH
sudo apt install zsh -y 

# Install oh-my-zsh
# From https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Delete the plugis section to replace it
#sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker kubectl history z)/g' ~/.zshrc
sed -i 's/plugins=(git)//g' ~/.zshrc

echo -e '\n\n## Tomer Settings ###\n' >> .zshrc
echo -e 'plugins=(\n git\n zsh-syntax-highlighting\n zsh-autosuggestions\n docker\n history\n z\n kubectl\n )\n' >> ~/.zshrc

cat <<EOT >> ~/.zshrc
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=yellow
#
#history
HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=999999999
export HISTFILESIZE=999999999
#
#alias
#
alias myip="curl ifconfig.co"
alias ddu="sudo du -h --max-depth=1 2>/dev/null | sort -hr | head -20"
EOT

#sudo apt install zsh-autosuggestions zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



vi ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
###change manual line1 and 6 for bad chr

#### doesnt work
#change charther instead of ? if not supported
# .oh-my-zsh/themes/robbyrussell.zsh-theme
#sed -i 's/PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"/PROMPT="%(?:%{$fg_bold[green]%}-> :%{$fg_bold[red]%}-> )"/g' ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
#sed -i 's/ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"/ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}x"/g' ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

#mv ~/.oh-my-zsh/themes/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme.backup
#touch ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
#cat <<EOT >> ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
#PROMPT="%(?:%{$fg_bold[green]%}-> :%{$fg_bold[red]%}-> )"
#PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}x"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
#EOT
#### doesnt work

#change default shell
chsh -s $(which zsh)



# add .zshtc file
# add plugins
# setup history long...
# change password

#setup .ssh config
#add public key
#disable password login

# fc -l 1


##reboot?

### move       source $ZSH/oh-my-zsh.sh        to the end
