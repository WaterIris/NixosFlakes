{pkgs, ...}: 
{
  programs.rofi = {
    enable = true;
    theme = ".config/rofi/conf.rasi";
    package = pkgs.rofi-wayland;
    plugins = [ 
      pkgs.rofi-power-menu
    ];
    extraConfig = {
      modes = "power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu --choices=shutdown/reboot/suspend";
    };
    pass.enable = true;
  };
  
  home.file.".config/rofi/conf.rasi" = {
    source = ./style.rasi;
  };
}
