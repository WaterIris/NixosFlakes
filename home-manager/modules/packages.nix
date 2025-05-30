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
    zoxide
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
    chromium
    qbittorrent
    blueman
    nautilus
    vscode
    obsidian
    pavucontrol
    firefox
    spotify
  ];
}
