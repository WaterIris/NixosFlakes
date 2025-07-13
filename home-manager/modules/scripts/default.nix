{...}:
{
  # Menus
  # Power menu with wofi
  home.file.".config/scripts/power-menu.sh" = {
    source = ./wofi-power-menu.sh;
  };

  home.file.".config/scripts/blue-man.sh" = {
    source = ./blueman-clicker.sh;
  };

  home.file.".config/scripts/pavu-control.sh" = {
    source = ./pavucontrol-clicker.sh;
  };

  # Notifications
  # Battery level
  home.file.".config/scripts/battery_notification" = {
    source = ./battery_notif;
    recursive = true;
  };
}
