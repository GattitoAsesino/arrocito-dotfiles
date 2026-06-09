#!/usr/bin/env bash

VIBRA=$1

# Nuevas rutas base simplificadas
DIR_NURTURE="$HOME/.config/vibes/nurture"
DIR_NINA="$HOME/.config/vibes/nina"

if [ "$VIBRA" = "nurture" ]; then
    echo "Cambiando a vibra Nurture (Claro/Verde)..."
    echo "nurture" > "$HOME/.config/vibes/.current_vibe"

    # 1. Fondo de pantalla
    feh --bg-scale $DIR_NURTURE/wallpaper.*

    # 2. Configuración de i3
    cp "$DIR_NURTURE/i3_config" "$HOME/.config/i3/config"
    i3-msg reload

    # 3. Polybar
    killall -q polybar
    polybar -c "$DIR_NURTURE/polybar.ini" example &

    # 4. Rofi
    cp "$DIR_NURTURE/rofi.rasi" "$HOME/.config/rofi/config.rasi"

    # 5. Kitty
    cp "$DIR_NURTURE/kitty.conf" "$HOME/.config/kitty/kitty.conf"
    kitty @ set-colors -a -c "$DIR_NURTURE/kitty.conf"

    # 6. Picom
    killall -q picom; sleep 0.3
    picom --config "$HOME/.config/vibes/picom.conf" -b

    # 7. Modo Claro para Floorp y GTK
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

    #8. Zathurac lector de pdfs
    mkdir -p "$HOME/.config/zathura"
    cp "$DIR_NURTURE/zathura/zathurarc" "$HOME/.config/zathura/zathurarc"
    cp "$DIR_NURTURE/zathura/catppuccin-latte" "$HOME/.config/zathura/catppuccin-latte"

    # 9. Visual Studio Code
    mkdir -p "$HOME/.config/Code/User"
    cp "$DIR_NURTURE/vscode_settings.json" "$HOME/.config/Code/User/settings.json"

    # 10. Fastfetch Config
    mkdir -p /home/gatito-asesino/.config/fastfetch
    cp /home/gatito-asesino/.config/vibes/nurture/fastfetch/config.jsonc /home/gatito-asesino/.config/fastfetch/config.jsonc
    cp /home/gatito-asesino/.config/vibes/nurture/fastfetch/gatito_art.txt /home/gatito-asesino/.config/fastfetch/gatito_art.txt

    # 11. CAVA Config
    mkdir -p "$HOME/.config/cava"
    cp /home/gatito-asesino/.config/vibes/nurture/cava/config /home/gatito-asesino/.config/cava/config

   elif [ "$VIBRA" = "nina" ]; then
    echo "Cambiando a vibra Nina (Oscuro/Azul)..."
    echo "nina" > "$HOME/.config/vibes/.current_vibe"

    # 1. Fondo de pantalla
    feh --bg-fill "$DIR_NINA/wallpaper.jpg"

    # 2. Configuración de i3
    cp "$DIR_NINA/i3_config" "$HOME/.config/i3/config"
    i3-msg reload

    # 3. Polybar
    killall -q polybar
    polybar -c "$DIR_NINA/polybar.ini" main &
    
    # 4. Rofi
    cp "$DIR_NINA/rofi.rasi" "$HOME/.config/rofi/config.rasi"
    
    # 5. Kitty
    cp "$DIR_NINA/kitty.conf" "$HOME/.config/kitty/kitty.conf"
    kitty @ set-colors -a -c "$DIR_NINA/kitty.conf"

    # 6. Picom
    killall -q picom; sleep 0.3
    picom --config "$HOME/.config/vibes/picom.conf" -b

    # 7. Modo Oscuro para Floorp y GTK
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

    # 8. Zathura
    mkdir -p "$HOME/.config/zathura"
    cp "$DIR_NINA/zathura/zathurarc" "$HOME/.config/zathura/zathurarc"
    cp "$DIR_NINA/zathura/catppuccin-latte" "$HOME/.config/zathura/catppuccin-latte"

else
    echo "Uso: change_vibes.sh [nurture|nina]"
fi
