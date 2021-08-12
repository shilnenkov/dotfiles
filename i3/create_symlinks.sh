echo "Installing i3..."

# i3 config
ln -sf ${PWD}/config/i3 ${HOME}/.config/i3

# scripts
sudo ln -sf ${PWD}/scripts/blurlock /usr/bin/blurlock
sudo ln -sf ${PWD}/scripts/i3exit /usr/bin/i3exit
sudo ln -sf ${PWD}/scripts/refresh_display_layout /usr/bin/refresh_display_layout

# compton
ln -sf ${PWD}/config/compton.conf ${HOME}/.config/compton.conf

# polybar
# install network-manager-applet volumeicon
ln -sf ${PWD}/config/polybar ${HOME}/.config/polybar

# fonts
mkdir -p ~/.fonts
cp ${PWD}/fonts/* ~/.fonts

# Xresources
ln -sf ${PWD}/Xresources ${HOME}/.Xresources
ln -sf ${PWD}/extend.Xresources ${HOME}/.extend.Xresources
xrdb ${HOME}/.Xresources

# Matcha-dark-sea theme
ln -sf ${PWD}/xsettingsd ${HOME}/.xsettingsd
xsettingsd &

# touchpad
sudo mkdir -p /etc/X11/xorg.conf.d && \
sudo ln -sf ${PWD}/xorg.conf.d/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf


