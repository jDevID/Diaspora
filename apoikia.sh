#!/bin/bash


# xmobarrc
ln -f ./xmobar/xmobarrc ~/.config/xmobar/
# doom emacs
ln -f ./doom/init.el ~/.emacs.d/
ln -f ./doom/packages.el ~/.emacs.d/
ln -f ./doom/config.el ~/.emacs.d/
# xmona
ln -f ./xmonad/xmonad.hs ~/.xmonad/
# .bashrc
sudo ln -f ./bash/.bashrc ~/

echo "hard linked + overwrote"
