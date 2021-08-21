#!/usr/bin/env bash

set -e

OS=$(lsb_release -si | tr '[:upper:]' '[:lower:]')

install_ubuntu() {
    # i3-gaps repo
    sudo add-apt-repository -y ppa:regolith-linux/release && \
    sudo apt-get update -y && \

    # i3-gaps compton rofi feh
    sudo apt-get install -y i3-gaps i3lock compton rofi feh

    # i3lock-color
    sudo apt install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev \
                        libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev \
                        libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev \
                        libxcb-util-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev \
                        libxkbcommon-x11-dev libjpeg-dev
    rm -rf /tmp/i3lock-color
    git clone https://github.com/Raymo111/i3lock-color.git /tmp/i3lock-color
    cd /tmp/i3lock-color && ./build.sh && sudo ./install-i3lock-color.sh

    # polybar
    sudo apt-get install -y \
                 cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
                 libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
                 libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen \
                 xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev \
                 libiw-dev libcurl4-openssl-dev libpulse-dev \
                 libxcb-composite0-dev xcb libxcb-ewmh2 libjsoncpp-dev
    rm -rf /tmp/polybar
    git clone https://github.com/jaagr/polybar.git /tmp/polybar
    cd /tmp/polybar && ./build.sh

    # Matcha-gtk-theme
    sudo apt-get install -y gtk2-engines-murrine gtk2-engines-pixbuf
    rm -rf /tmp/Matcha-gtk-theme
    git clone https://github.com/vinceliuice/Matcha-gtk-theme.git \
              /tmp/Matcha-gtk-theme
    cd /tmp/Matcha-gtk-theme && sudo ./install.sh

    # papirus-icon-theme
    sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu focal main' > /etc/apt/sources.list.d/papirus-ppa.list"
    sudo apt-get install -y dirmngr
    sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E58A9D36647CAE7F
    sudo apt-get update && sudo apt-get install -y papirus-icon-theme

    # xsettingsd to apply themes
    sudo apt-get install -y xsettingsd

    # Autostart applications
    sudo apt-get install -y blueman volumeicon

    # lightdm
    sudo apt-get install -y lightdm

    # lightdm-webkit2-greeter
    sudo apt-get install -y liblightdm-gobject-1-dev libgtk-3-0 libwebkit2gtk-4.0-dev \
                            libdbus-glib-1-dev ninja-build meson
    rm -rf /tmp/web-greeter
    git clone https://github.com/Antergos/web-greeter.git --branch 2.2.5 /tmp/web-greeter
    mkdir -p /tmp/web-greeter/build
    cd /tmp/web-greeter/build && meson --prefix=/usr --libdir=lib .. && \
                                 ninja && sudo ninja install
    sudo cp ${PWD}/config/i3/wallpapers/LightBulb.jpga /usr/share/backgrounds 

    # lightdm-webkit-theme-litarvan
    rm -rf /tmp/lightdm-webkit-theme-litarvan-3.2.0.tar.gz
    wget https://github.com/Litarvan/lightdm-webkit-theme-litarvan/releases/download/v3.2.0/lightdm-webkit-theme-litarvan-3.2.0.tar.gz \
        -O /tmp/lightdm-webkit-theme-litarvan-3.2.0.tar.gz
    sudo mkdir -p /usr/share/lightdm-webkit/themes/litarvan 
    sudo tar -xvf /tmp/lightdm-webkit-theme-litarvan-3.2.0.tar.gz \
             -C /usr/share/lightdm-webkit/themes/litarvan
}

install_${OS}

# i3status-rust clipit
