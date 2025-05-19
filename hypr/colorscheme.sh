#!/bin/bash
# Hybrid approach that preserves config

wal -i $HOME/pics/wpps/rose-pine-sword.jpg
mapfile -t colors < <(cat ~/.cache/wal/colors | sed 's/#//g')

# Create temp file with new color variables
echo "# Pywal Colors - Auto-generated" > /tmp/hypr-colors
for i in {0..15}; do
    echo "\$color${i} = 0xff${colors[$i]}" >> /tmp/hypr-colors
done

# Combine with existing config (excluding old color vars)
grep -vE '\$color[0-9]+ =' $XDG_CONFIG_HOME/hypr/hyprland.conf >> /tmp/hypr-colors

# Replace config
mv /tmp/hypr-colors $XDG_CONFIG_HOME/hypr/hyprland.conf

# FORCE border color update (critical fix)
hyprctl keyword general:col.active_border "0xff${colors[2]} 0xff${colors[4]} 45deg"
hyprctl keyword general:col.inactive_border "0xff${colors[8]}"

hyprctl reload
