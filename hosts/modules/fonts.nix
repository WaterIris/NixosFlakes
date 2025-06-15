{pkgs, ...}:
{
  fonts = {
    packages = [
      pkgs.nerd-fonts.jetbrains-mono
      # pkgs.nerd-fonts.iosevka-term
      pkgs.nerd-fonts.iosevka
      pkgs.nerd-fonts.ubuntu-mono
    ];
  }; 
}
