#!/bin/sh -xe
# https://www.atlassian.com/git/tutorials/dotfiles

cd

rm -rf .git_dotfiles/
mkdir .git_dotfiles
alias dotfiles='git --git-dir=$HOME/.git_dotfiles/ --work-tree=$HOME'
dotfiles init
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:NextFire/dotfiles.git
dotfiles fetch
dotfiles switch -f macos

gpg -do .secrets.tar.gz .secrets.tar.gz.gpg
rm -rf .secrets/
tar xvf .secrets.tar.gz
rm .secrets.tar.gz
