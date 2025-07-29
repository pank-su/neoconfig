#!/bin/sh

# Update all packages
yay --noconfirm -Syu 

# Install needed packages
yay --noconfirm -S hyprland ghostty firefox emacs-wayland hunspell hunspell-ru tofi hyprpaper
