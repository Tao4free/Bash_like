#!/bin/bash
# This bash script is used to set up bash and vim in Mac 
# Tt is also simple to modify this for linux

# Reference:
# https://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script
# https://stackoverflow.com/questions/17583578/what-command-means-do-nothing-in-a-conditional-in-bash/17583599
# https://unix.stackexchange.com/questions/28865/list-the-difference-and-overlap-between-two-plain-data-set
# https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script/18434835
# https://gist.github.com/bermi/4125859
# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
# https://github.com/VundleVim/Vundle.vim/issues/511

# Install ctags
case "$OSTYPE" in
  linux*)   echo "Linux / WSL" ;;
  darwin*)  brew install ctags-exuberant go cmake;; #  echo "Mac OS" ;; 
  win*)     echo "Windows" ;;
  msys*)    echo "MSYS / MinGW / Git Bash" ;;
  cygwin*)  echo "Cygwin" ;;
  bsd*)     echo "BSD" ;;
  solaris*) echo "Solaris" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

# Copy the settings to files
cplist="bash_profile bashrc vimrc"
for i in $cplist; do 
    # check whether thre any comm line contents exists in the configure file
    [ ! -f ~/.$i ] && touch ~/.$i
    com=`comm -12 $i ~/.$i`
    # -z is to check wether a variable is none/null or not
    if [ -z "$com" ]; then
        cat $i >> ~/.$i
    fi
done
# grep -f bash_profile ~/.bash_profile
# cat bash_profile >> ~/.bash_profile
# cat bashrc >> ~/.bashrc
# cat vimrc >> ~/.vimrc

# Creat a .vim foder is not exited
mkdir -p ~/.vim/

# Copy the comment function to .vim/
cp vcomments.vim ~/.vim/

# Copy color scheme for vimdiff
cp -r colors/ ~/.vim/

# Install Vundle https://github.com/VundleVim/Vundle.vim
# Check if a directory does not exist
dir=~/.vim/bundle/Vundle.vim/
if [ -d "$dir" ]
then
    # echo "Directory /path/to/dir DOES exists."
    : # : means doing nothing
else
    # echo "Directory /path/to/dir DOES NOT exists."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo | echo | vim +PluginInstall +qall &>/dev/null
echo | echo | vim +GoInstallBinaries +qall &>/dev/null

python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer
