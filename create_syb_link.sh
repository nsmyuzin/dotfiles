#!/bin/sh
##シンボリックリンクを貼るシェルだよ
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/indent ~/.vim
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zsh.d/alias.zsh ~/alias.zsh
ln -sf ~/dotfiles/.zsh.d/function.zsh ~/function.zsh
##neovim系 未完成、使用する予定なら実行後編集を加えること
ln -snfv ~/dotfiles/.vim ~/.config/nvim/
ln -snfv ~/dotfiles/init.vim ~/.config/nvim/init.vim
