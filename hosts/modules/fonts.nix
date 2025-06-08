{pkgs, ...}:
{
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override{ fonts = ["JetBrainsMono" "Iosevka" "UbuntuMono"]; })
    ];
  }; 
}
