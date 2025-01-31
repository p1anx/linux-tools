#!/bin/bash
function custom_keybindings(){
  # 定义配置文件路径
  CONFIG_FILE="gnome_custom_keybinding.ini"

  # 创建配置文件内容
  cat <<EOL > $CONFIG_FILE
[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Alt>d'
command='/home/$USER/.config/rofi/scripts/quickLauncher.sh'
name='rofi launcher'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1]
binding='<Alt>w'
command='/home/$USER/.config/rofi/scripts/quickWindow.sh'
name='rofi window'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2]
binding='<Alt>e'
command='/home/$USER/.config/rofi/scripts/quickeEdit.sh'
name='quick edit'
[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3]
binding='<Alt>Return'
command='alacritty'
name='open terminal'
EOL

  # 使用 dconf 加载配置
  cat $CONFIG_FILE | dconf load '/'

  # 输出成功信息
  echo "Custom keybindings loaded successfully!"

}

function normal_keybindings(){
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Alt>1']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Alt>2']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Alt>3']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Alt>4']"

  gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "['<Alt><Shift>v']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-center "['<Alt>space']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-side-e "['<Alt>l']"
  gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>s']"
  gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>m']"
  gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>q']"
  gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Alt>f']"
  gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Shift><Alt>r']"
  gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
}
normal_keybindings
custom_keybindings
