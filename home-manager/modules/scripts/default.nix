{...}:
{
  # Menus
  # Power menu with wofi
  home.file.".config/scripts/power-menu.sh" = {
    source = ./wofi-power-menu.sh;
  };
  # Notifications
  # Battery level
  home.file.".config/scripts/battery_notification" = {
    source = ./battery_notif;
    recursive = true;
  };
}
