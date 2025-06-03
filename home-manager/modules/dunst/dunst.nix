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
        background = "#1a2137";
        foreground = "#cdd6f4";
      };

      urgency_low = {
        background = "#1a2137";
        highlight = "#83C092";
        frame_color = "#83C092";
        timeout = 3;
      };

      urgency_normal = {
        background = "#1a2137";
        highlight = "#e5c890";
        frame_color = "#e5c890";
        timeout = 4;
      };

      urgency_critical = {
        background = "#1a2137";
        highlight = "#fb80aa";
        frame_color = "#fb80aa";
        timeout = 10;
      };  
    };
  };

  home.file.".config/notifs" = {
    source = ./battery_notif;
    recursive = true;
  };
}
