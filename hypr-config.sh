#!/bin/bash

# Lista de aplicaciones a instalar
apps=(
    "nvtop"
    "zen-browser-bin"
    "visual-studio-code-bin"
    "nextcloud-client"
    "liquidctl"
    "gitkraken"
    "lazygit"
    "btop"
    "dbeaver"
    "php"
    "php-bz2"
    "curl"
    "gcc"
    "binutils"
    "autoconf"
    "pkg-config"
    "libxml2"
    "zlib"
    "composer"
    "sqlite"
    "php-sqlite"
    "php-gd"
    "php-sodium"
    "gnome-keyring"
)

# Instalar aplicaciones
echo "Instalando aplicaciones..."
yay -S --noconfirm "${apps[@]}"

# Limpiar la caché de paquetes
echo "Limpiando caché de paquetes..."
yay -Rns $(pacman -Qdtq) --noconfirm
