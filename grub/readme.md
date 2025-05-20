# How to install a grub theme

Extract the theme to /boot/grub/themes/

Edit /etc/default/grub file. Find the line starting with "#GRUB_THEME" and change it to "GRUB_THEME=/boot/grub/themes/[THEME_FOLDER]/[theme.txt]" (replace [THEME_FOLDER] ; [theme.txt] is probably OK ; remove "[]" brackets)

Run sudo update-grub

See also: https://de.wikipedia.org/wiki/Grand_Unified_Bootloader
