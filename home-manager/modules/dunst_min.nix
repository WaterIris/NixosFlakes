{...}:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font";
        corner_radius = 2;
        background = "#393552";
        foreground = "#e0def4";
      };

      urgency_low = {
        background = "#393955";
        highlight = "#3e8fb0";
        frame_color = "#3e8fb0";
      };
      urgency_normal = {
        background = "#443c53";
        highlight = "#f6c177";
        frame_color = "#f6c177";
      };
      urgency_critical = {
        background = "#433754";
        highlight = "#eb6f92";
        frame_color = "#eb6f92";
      };  
    };
  };
}
