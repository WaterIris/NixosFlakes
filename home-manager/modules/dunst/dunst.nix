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
        background = "#313244E6";
        foreground = "#cba6f7E6";
      };

      urgency_low = {
        background = "#313244E6";
        highlight = "#f9e2afE6";
        frame_color = "#f9e2afE6";
        timeout = 3;
      };

      urgency_normal = {
        background = "#313244E6";
        highlight = "#89b4faE6";
        frame_color = "#89b4faE6";
        timeout = 4;
      };

      urgency_critical = {
        background = "#313244E6";
        highlight = "#f38ba8E6";
        frame_color = "#f38ba8E6";
        timeout = 10;
      };  
    };
  };

  home.file.".config/notifs" = {
    source = ./battery_notif;
    recursive = true;
  };
}
