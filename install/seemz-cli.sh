#!/bin/bash
theme=$(cat "$HOME/.SeemZ/theme.active")
wallpBRUT=$(ls "$HOME/.SeemZ/$theme/" | shuf -n 1)
wallp=$(echo $wallpBRUT | cut -d '.' -f 1)
cp "$HOME/.config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini.old"
cat << EOF > "$HOME/.config/gtk-3.0/settings.ini"
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
cat << EOF > "$HOME/.gtkrc-2.0"
gtk-icon-theme-name="oomox-$theme-$wallp"
gtk-theme-name="oomox-$theme-$wallp"
gtk-cursor-theme-name=xcursor-breeze
gtk-font-name="Source Code Pro Medium 10"
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
# cat "$HOME/.config/gtk-3.0/settings.ini" | head -n 3 | sed -e 's/=*/="*"$/g'
wal -a "65" -i "$HOME/.SeemZ/$theme/$wallpBRUT"
echo "mon user === $USER ::::: $wallpBRUT" > "$HOME/.SeemZ/script.over"
###il faut vérifié pre install les variable dans Xresources et le I3 config