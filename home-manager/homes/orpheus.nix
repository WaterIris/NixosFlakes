{...}:
{
  home.username = "iris";
  home.homeDirectory = "/home/iris";
  nixpkgs.config.allowUnfree = true;
  imports = [
    ../modules/packages.nix
    ../modules/hyprland/hyprland.nix
    ../modules/hyprland/hyprpaper.nix
    ../modules/hyprland/hyprshot.nix
    ../modules/waybar/waybar.nix
    ../modules/kitty/kitty.nix
    ../modules/zsh.nix
    ../modules/rofi/rofi.nix
    ../modules/git.nix
    ../modules/direnv.nix
    ../modules/bg/bg.nix
    ../modules/dunst.nix
    ../modules/bash.nix
    ../modules/tmux/tmux.nix
  ];

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.11";
}
