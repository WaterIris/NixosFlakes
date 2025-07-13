{...}:
{
  services.dunst = {
    enable = true;
    waylandDisplay = "wayland-1";
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font";
        corner_radius = 5;
        origin = "top-right";
        offset = "10x10";
        monitor = -1;
        frame_width = 0;
        background = "#27272a";
        foreground = "#ffffff";
        frame_color = "#3f3f46";
      };

      urgency_low = {
        background = "#27272a";
        highlight = "#ffffff";
        frame_color = "#3f3f46";
        timeout = 3;
      };

      urgency_normal = {
        background = "#27272a";
        highlight = "#ffffff";
        frame_color = "#3f3f46";
        timeout = 4;
      };

      urgency_critical = {
        background = "#27272a";
        highlight = "#ffffff";
        frame_color = "#3f3f46";
        timeout = 10;
      };  
    };
  };

  
}
