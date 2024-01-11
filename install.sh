#!/bin/bash

set -o errexit  # Abort on nonzero exit status
set -o nounset  # Abort on unset variable
set -o pipefail # Do not hide erros within pipes

readonly script_dir
script_dir="$(dirname "$(readlink -f "$0")")"

install_ycm() {
  (
    cd ~/.vim/bundle/YouCompleteMe || return "$?"
    python3 ./install.py --all
  )
}

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/tmp

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

sudo apt update && sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

cp "$script_dir/config/zshrc" ~/.zshrc
cp "$script_dir/config/gitconfig" ~/.gitconfig
cp "$script_dir/config/tmux.conf" ~/.tmux.conf
cp "$script_dir/config/vimrc" ~/.vimrc
cp "$script_dir/config/p10k.zsh" ~/.p10k.zsh
cp "$script_dir/config/profile" ~/.profile
cp "$script_dir/config/bashrc" ~/.bashrc

vim +PluginInstall +qall 1>/dev/null
