# Define power options
options="Shutdown\nReboot\nSuspend"
wofi_width=200

# Show the menu with wofi
choice=$(echo -e "$options" | wofi --dmenu \
  --prompt "Power Menu" \
  --lines 5 \
  --width "$wofi_width" \
  --no-persist \
  --allow-markup \
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
