# OS X Config File - Carlos Cuesta
# This file handles all my configuration for the OS X system that I'm using like preferences and other stuff.

source './osx/utils.sh'
execution_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

clear	
print_in_purple '\nOS X Config Dotfiles - Carlos Cuesta\n\n'
ask_for_sudo

chmod u+x ./osx/*.sh
chmod u+x ./osx/software/*.sh

./osx/computer-info.sh
#./osx/osx-preferences.sh
./osx/software/xcode-install.sh
./osx/zsh-ohmyzsh.sh

# Copying the dotfiles to the home folder
# .zshrc, .gitconfig -> $HOME | nico.zsh-theme -> $HOME/.oh-my-zsh/themes 
for file in $execution_dir/.{zshrc,gitconfig}; do
	execute "cp -iv "$file" $HOME/"
done;
unset file;

execute "cp -iv $execution_dir/nico.zsh-theme $HOME/.oh-my-zsh/themes/"
print_success ".zshrc,.gitconfig,nico.zsh-theme copied!."

./osx/git-config.sh

directory_exists "$HOME/.dotfiles"

# .files -> $HOME/.dotfiles/
for files in $execution_dir/.{aliases,functions,exports,extra}; do
	execute "cp -iv "$files" $HOME/.dotfiles/";
done;
unset files;
print_success ".files copied to your $HOME/.dotfiles/ directory."

./osx/restart.sh