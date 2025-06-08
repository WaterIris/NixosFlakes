{...}:
{
  services.dunst = {
    enable = true;
    waylandDisplay = "wayland-1";
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font";
        corner_radius = 8;
        origin = "top-right";
        offset = "16x16";
        monitor = -1;
        frame_width = 2;
        background = "#101319E6";
        foreground = "#cdd6f4E6";
      };

      urgency_low = {
        background = "#101319E6";
        highlight = "#83C092E6";
        frame_color = "#83C092E6";
        timeout = 3;
      };

      urgency_normal = {
        background = "#101319E6";
        highlight = "#e5c890E6";
        frame_color = "#e5c890E6";
        timeout = 4;
      };

      urgency_critical = {
        background = "#101319E6";
        highlight = "#fb80aaE6";
        frame_color = "#fb80aaE6";
        timeout = 10;
      };  
    };
  };

  home.file.".config/notifs" = {
    source = ./battery_notif;
    recursive = true;
  };
}
