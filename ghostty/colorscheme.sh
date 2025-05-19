#!/usr/bin/env bash
# Ghostty Pywal theme applier – correct config format for Ghostty >=1.1.x

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.dotfiles}/ghostty/themes"
TARGET_THEME="$CONFIG_DIR/pywal_theme.conf"
WAL_CACHE="$HOME/.cache/wal"
WALLPAPER="$HOME/pics/wpps/rose-pine-sword.jpg"

mkdir -p "$CONFIG_DIR"

# Generate colors with wal if missing
if [ ! -f "$WAL_CACHE/colors" ]; then
    echo "➤ Generating Pywal theme from $WALLPAPER..."
    wal -i "$WALLPAPER" -q 2>/dev/null
fi

# Read 16 Pywal colors
colors=($(grep -E '^#([A-Fa-f0-9]{6})' "$WAL_CACHE/colors"))
if [ "${#colors[@]}" -lt 16 ]; then
    echo "✖ Pywal did not generate 16 colors. Check your image or wal setup." >&2
    exit 1
fi

# Create a temp theme file
TMP_THEME=$(mktemp "$CONFIG_DIR/tmp.theme.XXXXXX")

# Write Ghostty-compatible theme config in the correct format
{
    echo "palette = 0=${colors[0]}"
    echo "palette = 1=${colors[1]}"
    echo "palette = 2=${colors[2]}"
    echo "palette = 3=${colors[3]}"
    echo "palette = 4=${colors[4]}"
    echo "palette = 5=${colors[5]}"
    echo "palette = 6=${colors[6]}"
    echo "palette = 7=${colors[7]}"
    echo "palette = 8=${colors[8]}"
    echo "palette = 9=${colors[9]}"
    echo "palette = 10=${colors[10]}"
    echo "palette = 11=${colors[11]}"
    echo "palette = 12=${colors[12]}"
    echo "palette = 13=${colors[13]}"
    echo "palette = 14=${colors[14]}"
    echo "palette = 15=${colors[15]}"

    echo "background = ${colors[0]}"
    echo "foreground = ${colors[7]}"
    echo "cursor-color = ${colors[7]}"
    echo "cursor-text = ${colors[7]}"
    echo "selection-background = ${colors[8]}"
    echo "selection-foreground = ${colors[7]}"
} >> "$TMP_THEME"

# Replace theme if changed
if ! cmp -s "$TMP_THEME" "$TARGET_THEME"; then
    mv "$TMP_THEME" "$TARGET_THEME"
    echo "✔ Ghostty theme updated at: $TARGET_THEME"
    echo "➤ Restart Ghostty to apply changes."
else
    rm "$TMP_THEME"
    echo "✓ Theme already up to date."
fi
