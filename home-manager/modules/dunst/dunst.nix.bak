{...}:
{
  services.dunst = {
    enable = true;
    waylandDisplay = "wayland-1";
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font";
        corner_radius = 16;
        origin = "top-right";
        offset = "0x0";
        monitor = -1;
        frame_width = 2;
        background = "#101319";
        foreground = "#e7ebf6";
      };

      urgency_low = {
        background = "#101319";
        highlight = "#56b8f7";
        frame_color = "#56b8f7";
        timeout = 3;
      };

      urgency_normal = {
        background = "#101319";
        highlight = "#f6c177";
        frame_color = "#f6c177";
        timeout = 4;
      };

      urgency_critical = {
        background = "#101319";
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
