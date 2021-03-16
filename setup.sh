#! /bin/bash
set -e

msg () {
  echo "MSG: $@" >&2
}

err () {
  echo "ERR: $@" >&2
}

banner () {
  local banner_line="## [$@] ##"
  msg "$(printf '%0.s#' $(seq 1 ${#banner_line}))"
  msg $banner_line
  msg "$(printf '%0.s#' $(seq 1 ${#banner_line}))"
}

gnu_ln=""
case "$(uname)" in
  Darwin*)
    gnu_ln="gln"
    ;;
  Linux*)
    gnu_ln="ln"
    ;;
  *)
    err "Only support Darwin or Linux."
    exit 1
esac

# Ensure the GNU link has been installed.
# See https://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities
$gnu_ln --version > /dev/null

DOT_TOP=$(realpath $(dirname $BASH_SOURCE))

banner "Setup bash configuration"

msg "Create soft link to .bashrc"
$gnu_ln -sfb -T $DOT_TOP/bash_profile ~/.bash_profile

msg "Create soft link to .bashrc"
$gnu_ln -sfb -T $DOT_TOP/bashrc ~/.bashrc

msg "Create soft link to .bash_aliases"
$gnu_ln -sfb -T $DOT_TOP/bash_aliases ~/.bash_aliases

msg "Create soft link to .bash_completions"
$gnu_ln -sfb -T $DOT_TOP/bash_completions ~/.bash_completions

echo ""
banner "Setup vim configuration"

msg "Create soft link to .vimrc"
$gnu_ln -sfb -T $DOT_TOP/vimrc ~/.vimrc

msg "Create soft link to .vim"
$gnu_ln -sfb -T $DOT_TOP/vim ~/.vim

msg "Install Vundle from GitHub"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

msg "Install Plugin"
vim +PluginInstall +qall

msg "Install fzf"
bash $DOT_TOP/vim/bundle/fzf/install
