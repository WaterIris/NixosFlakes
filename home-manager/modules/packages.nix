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
    wl-clipboard
    pass
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
    hyprpicker
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
