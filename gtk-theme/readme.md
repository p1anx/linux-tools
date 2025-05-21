# set the icon of gtk
## install the icon on ubuntu
```
sudo add-apt-repository ppa:papirus/papirus
sudo apt install papirus-icon-theme -y
```
## set the startup of icon theme 
add the following scripts to `/etc/profile.d` directory
```my_startup.sh
#!/bin/bash
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

```
