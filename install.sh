#!/bin/zsh

perl install-cronjobs.pl
cat smartcd-export | smartcd import

# vim works differently on win32
case $OSTYPE in
   cygwin)
      home="$(cygpath $USERPROFILE)";
      rm -rf "$home/_vimrc";
      cp vimrc "$home/_vimrc";
      rm -rf "$home/.vim";
      cp -r vim "$home/.vim";
      mkdir -p "$home/var/undo";
      mkdir -p "$home/var/swap";
   ;;
   *)
      link-file vimrc ~/.vimrc
      link-file vim ~/.vim
   ;;
esac
