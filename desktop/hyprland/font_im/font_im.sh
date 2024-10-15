#!/bin/bash
function font() {
  sudo tee -a /etc/locale.gen <<EOF
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
zh_SG.UTF-8 UTF-8
EOF
  sudo local-gen
  if [ ! -f ~/.xinitrc ]; then
    touch ~/.xinitrc
  fi
  if [ ! -f ~/.xprofile ]; then
    touch ~/.xprofile
  fi
  tee -a ~/.xinitrc <<EOF
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
EOF
  tee -a ~/.xprofile <<EOF
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
EOF
  if grep -q "arch" /etc/os-release; then
    sudo pacman -S noto-fonts-cjk --noconfirm
  fi

}
function im() {
  #sudo pacman -S --noconfirm fcitx5-rime fcitx5-im fcitx5-chinese-addons fcitx5-material-color fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki
  sudo pacman -S --noconfirm fcitx5-rime fcitx5-im fcitx5-material-color
  yay -S --noconfirm rime-ice-git
  tee -a ~/.bashrc <<EOF
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
EOF

  if [ ! -f ~/.local/share/fcitx5/rime/default.custom.yaml ]; then
    mkdir -p ~/.local/share/fcitx5/rime/
    touch ~/.local/share/fcitx5/rime/default.custom.yaml
  fi
  tee -a ~/.local/share/fcitx5/rime/default.custom.yaml << EOF
  patch:
  # 仅使用「雾凇拼音」的默认配置，配置此行即可
  __include: rime_ice_suggestion:/
  # 以下可根据自己所需进行自定义，仅做参考。
  EOF
  #set themes
  git clone https://github.com/thep0y/fcitx5-themes.git
  cd fcitx5-themes
  cp macOS-dark ~/.local/share/fcitx5/themes -r

}
function font_im(){
  font
  im
}
