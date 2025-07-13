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
        offset = "20x20";
        monitor = -1;
        frame_width = 4;
        background = "#292a37";
        foreground = "#d9e0ee";
      };

      urgency_low = {
        background = "#292a37";
        highlight = "#d9e0ee";
        frame_color = "#44465c";
        timeout = 3;
      };

      urgency_normal = {
        background = "#292a37";
        highlight = "#d9e0ee";
        frame_color = "#44465c";
        timeout = 4;
      };

      urgency_critical = {
        background = "#292a37";
        highlight = "#d9e0ee";
        frame_color = "#44465c";
        timeout = 10;
      };  
    };
  };

  
}
