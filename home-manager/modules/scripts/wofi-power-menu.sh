# Define power options
options="Shutdown\nReboot\nSuspend"
wofi_width=240
wofi_height=240

# Show the menu with wofi
choice=$(echo -e "$options" | wofi --dmenu \
  --prompt "Power Menu" \
  --lines 6 \
  --width "$wofi_width" \
  --height "$wofi_height" \
  --no-persist \
  --allow-markup \
  --location "top_right" \
  --xoffset -10 \
  --hide-scroll)

# Act based on user choice
case "$choice" in
  Shutdown)
    systemctl poweroff
    ;;
  Reboot)
    systemctl reboot
    ;;
  Suspend)
    systemctl suspend
    ;;
esac
