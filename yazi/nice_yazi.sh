#!/bin/bash
yazi_install(){
  

}
yazi_plugin(){
  ya pack -a yazi-rs/plugins:full-border
  ya pack -a yazi-rs/plugins:max-preview
  ya pack -a yazi-rs/plugins:git
  ya pack -a yazi-rs/plugins:smart-filter
  ya pack -a yazi-rs/plugins:diff


}
yazi_flavors(){
  ya pack -a sanjinso/monokai-vibrant
  ya pack -a yazi-rs/flavors:catppuccin-mocha
  ya pack -a yazi-rs/flavors:catppuccin-latte
  ya pack -a yazi-rs/flavors:catppuccin-frappe
  ya pack -a yazi-rs/flavors:catppuccin-macchiato
  ya pack -a tkapias/moonfly.yazi
  ya pack -a tkapias/nightfly.yazi
  # Linux/macOS
  git clone https://github.com/BennyOe/onedark.yazi.git ~/.config/yazi/flavors/onedark.yazi
  git clone https://github.com/BennyOe/tokyo-night.yazi.git ~/.config/yazi/flavors/tokyo-night.yazi
  ya pack -a dangooddd/kanagawa
  ya pack -a marcosvnmelo/kanagawa-dragon
  ya pack -a bennyyip/gruvbox-dark
  ya pack -a PinThePenguine/sunset
  ya pack -a kmlupreti/ayu-dark
  ya pack -a Chromium-3-Oxide/everforest-medium
  
}
yazi_config(){
  tee -a ~/.zshrc <<EOF
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
EOF

}
