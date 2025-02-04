# Current changes to gnome



`gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false` - didn't work



`gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
for i in $(seq 1 9); do gsettings set org.gnome.shell.keybindings switch-to-application-${i} '[]'; done` - This one worked


## hide title bar

gsettings set org.gnome.shell.extensions.unite hide-titlebar 'always'

