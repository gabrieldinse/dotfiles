#!/bin/bash

set -o errexit  # Abort on nonzero exit status
set -o nounset  # Abort on unset variable
set -o pipefail # Do not hide erros within pipes

readonly script_dir="$(dirname "$(readlink -f "$0")")"

install_ycm() {
  (
    cd ~/.vim/bundle/YouCompleteMe || return "$?"
    python3 ./install.py --all
  )
}

#mkdir -p ~/.vim/bundle
#mkdir -p ~/.vim/tmp
#
#if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
#then
#  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#fi

sudo apt update && sudo apt upgrade -y && sudo apt install zsh curl
if [[ -d "${HOME}/.oh-my-zsh" ]]; then
	rm -rf "${HOME}/.oh-my-zsh"
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [[ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
	rm -rf "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

#git clone https://github.com/github/copilot.vim.git \
#  ~/.vim/pack/github/start/copilot.vim

cp "$script_dir/zshrc" ~/.zshrc
cp "$script_dir/gitconfig" ~/.gitconfig
cp "$script_dir/tmux.conf" ~/.tmux.conf
#cp "$script_dir/config/vimrc" ~/.vimrc
cp "$script_dir/p10k.zsh" ~/.p10k.zsh
cp "$script_dir/profile" ~/.profile
cp "$script_dir/bashrc" ~/.bashrc

#vim +PluginInstall +qall 1>/dev/null
#vim +"Copilot setup" +qall 1>/dev/null

