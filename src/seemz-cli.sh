#!/bin/bash
theme=$(cat "$HOME/.SeemZ/theme.active")
wallpBRUT=$(ls "$HOME/.SeemZ/$theme/" | shuf -n 1)
wallp=$(echo $wallpBRUT | cut -d '.' -f 1)
cat << EOF > "$HOME/.config/gtk-3.0/settings.ini.new"
[Settings]
gtk-icon-theme-name=oomox-$theme-$wallp
gtk-theme-name=oomox-$theme-$wallp
gtk-cursor-theme-name=xcursor-breeze
gtk-font-name=Source Code Pro Medium 10
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
gtk-application-prefer-dark-theme=true
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-modules=gail:atk-bridge
EOF