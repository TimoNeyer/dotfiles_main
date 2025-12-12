#!/bin/env sh

set -e

cmd() {
  echo "[*] $*" >&2
  "$@"
}

install_vim_plugins() {
  PLUG_VIM="$HOME/.vim/autoload/plug.vim"
  if [ ! -f "$PLUG_VIM" ]; then
    cmd curl -fLo "$PLUG_VIM" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
  cmd vim +PlugInstall +qall
}

install_nvim_plugins() {
  cmd nvim --headless "+Lazy! sync" +qa
}

link_vim() {
  if [[ -d "$HOME/.vim" ]]; then
    echo "Moving existing ~/.vim directory to ~/.vim.bak"
    cmd mv $HOME/.vim $HOME/.vim.bak
  fi
  cmd ln -s $HOME/.config/vim/vim $HOME/.vim
  if [[ -f "$HOME/.vimrc" ]]; then
    echo "Moving existing ~/.vimrc directory to ~/.vimrc.bak"
    cmd mv $HOME/.vimrc $HOME/.vimrc.bak
  fi
  cmd ln -s $HOME/.config/vim/vimrc $HOME/.vimrc
  echo Successfully linked vim configurations into home dir
}

link_zsh() {
  if [[ -f "$HOME/.zshrc" ]]; then
    echo "Moving existing ~/.zshrc to ~/.zshrc.bak"
    cmd mv $HOME/.zshrc $HOME/.zshrc.bak
  fi
  cmd ln -s $HOME/.config/zsh/zshrc $HOME/.zshrc
  echo "Successfully linked zsh configurations into home dir"
  echo "Initialising zsh config"
  cmd zsh -c 'echo initialized'
}

link_git() {
  if [[ -f "$HOME/.gitconfig" ]]; then
    echo "Moving existing ~/.gitconfig to ~/.gitconfig.bak"
    cmd mv $HOME/.gitconfig $HOME/.gitconfig.bak
  fi
  cmd ln -s $HOME/.config/git/config.git $HOME/.gitconfig
}

init_tmux() {
  if [[ -f "$HOME/.tmux.conf" ]]; then
    echo "Moving existing ~/.tmux.conf to ~/.tmux.conf.bak"
    cmd mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
  fi
  cmd ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf
  git clone https://github.com/tmux-plugin/tpm.git ~/.config/tmux/plugins/tpm
}

RETURN_DIR=""
if [[ "$(pwd)" != "$HOME" ]]; then
  RETURN_DIR="1"
  pushd >/dev/null
  cd $HOME
fi
link_vim
install_vim_plugins
install_nvim_plugins
link_zsh
link_git
init_tmux

if [[ "$RETURN_DIR" -eq 1 ]]; then
  popd >/dev/null
fi
