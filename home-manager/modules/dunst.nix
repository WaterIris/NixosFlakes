{...}:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font";
        corner_radius = 16;
        origin = "top-right";
        offset = "0x0";
        frame_width = 3;
        background = "#101319";
        foreground = "#e7ebf6";
      };

      urgency_low = {
        background = "#101319";
        highlight = "#56b8f7";
        frame_color = "#56b8f7";
        timeout = 10;
      };
      urgency_normal = {
        background = "#101319";
        highlight = "#f6c177";
        frame_color = "#f6c177";
        timeout = 10;
      };
      urgency_critical = {
        background = "#101319";
        highlight = "#fb80aa";
        frame_color = "#fb80aa";
      };  
    };
  };
}
