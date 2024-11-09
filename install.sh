#!/bin/sh

# Update all packages
yay --noconfirm -Syu 

# Install needed packages
yay --noconfirm -S hyprland kitty firefox emacs-wayland aspell aspell-ru tofi
