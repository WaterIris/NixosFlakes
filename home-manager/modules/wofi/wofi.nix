{...}: 
{
  programs.wofi = {
    enable = true;
    settings = {
      width = "20%";
      location = "center";
    };
  };
  home.file.".config/wofi/style.css" = {
    source = ./style.css;
    recursive = true;
  };
}
