{pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    # system basics
    zip
    unzip
    ripgrep
    brightnessctl
    feh
    usbutils
    acpi
    # cli
    neofetch
    nnn
    lazygit
    lazydocker
    tree
    htop
    imagemagick
    nvtopPackages.nvidia
    inputs.nixvim.packages.${system}.default
    dua
    # apps
    blueman
    nautilus
    vscode
    obsidian
    pavucontrol
    firefox
    spotify
  ];
}
