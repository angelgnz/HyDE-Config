#!/bin/bash

# Define los archivos de configuración
USERPREFS_FILE="$HOME/.config/hypr/userprefs.conf"
HYPRLAND_FILE="$HOME/.config/hypr/hyprland.conf"

# Asegúrate de que el directorio existe
if [ ! -d "$HOME/.config/hypr/" ]; then
    echo "El directorio $HOME/.config/hypr/ no existe."
    exit 1
fi

# Agrega los comandos al archivo userprefs.conf si no existen
{
    echo "windowrulev2 = opacity 0.90 0.90,class:^(zen)$"

    # Cliente de Nextcloud
    echo "#Cliente de Nextcloud"
    echo "##windowrulev2 = float,class:^(com.nextcloud.desktopclient.nextcloud)$"
    echo "##windowrulev2 = size 499 938,class:^(com.nextcloud.desktopclient.nextcloud)$"
    echo "##windowrulev2 = move 2930 35,class:^(com.nextcloud.desktopclient.nextcloud)$"

    # Scripts o aplicaciones a ejecutar al inicio
    echo "## Scripts o aplicaciones a ejecutar al inicio"
    echo "#Nextcloud (necesita estar instalado)"
    echo "exec-once = nextcloud"

    # Establecer el color por defecto de NZXT - Smart Device 2 & Kraken x63
    echo "exec-once = liquidctl --match smart set sync color fixed 7400b8"
    echo "exec-once = liquidctl --match kraken set sync color fixed 7400b8"
    echo "exec-once = liquidctl --match kraken set pump speed 100"
    echo "exec-once = liquidctl --match smart set fan1 speed 60"
    echo "exec-once = liquidctl --match smart set fan2 speed 60"
    echo "exec-once = liquidctl --match smart set fan3 speed 60"
    echo "
input {
    kb_layout = latam
    follow_mouse = 1

    touchpad {
        natural_scroll = yes
    }
}"
} | grep -Fx -v -f "$USERPREFS_FILE" >> "$USERPREFS_FILE"

echo "Los comandos han sido agregados a $USERPREFS_FILE si no existían previamente."

# Cambia la línea del archivo hyprland.conf de kb_layout
if grep -q "kb_layout = en" "$HYPRLAND_FILE"; then
    echo "Modificando el archivo $HYPRLAND_FILE para cambiar kb_layout a latam..."
    sed -i 's/kb_layout = en/kb_layout = latam/' "$HYPRLAND_FILE"
else
    echo "No se encontró 'kb_layout = en' en $HYPRLAND_FILE. No se realizó ninguna modificación."
fi

echo "Modificación completada en $HYPRLAND_FILE."