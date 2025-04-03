#!/bin/env sh

cmd() {
  echo "[*] $*" >&2
  "$@"
}

link_vim() {
  if [[ -d "$HOME/.vim" ]]; then
    echo "Moving existing ~/.vim directory to ~/.vim.bak"
    cmd mv $HOME/.vim $HOME/.vim.bak
  fi
  cmd ln -s $HOME/.config/Vim/vim $HOME/.vim
  if [[ -f "$HOME/.vimrc" ]]; then
    echo "Moving existing ~/.vimrc directory to ~/.vimrc.bak"
    cmd mv $HOME/.vimrc $HOME/.vimrc.bak
  fi
  cmd ln -s $HOME/.config/Vim/vimrc $HOME/.vimrc
  echo Successfully linked vim configurations into home dir
}

link_zsh() {
  if [[ -f "$HOME/.zshrc" ]]; then
    echo "Moving existing ~/.zshrc to ~/.zshrc.bak"
    cmd mv $HOME/.zshrc $HOME/.zshrc.bak
  fi
  cmd ln -s $HOME/.config/zsh/zshrc $HOME/.zshrc
  echo "Successfully linked zsh configurations into home dir"
}

link_vim
link_zsh
