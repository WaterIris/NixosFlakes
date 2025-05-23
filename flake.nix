{
  description = "Nix by Iris";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim.url = "github:WaterIris/nixvim-conf";
  };

  outputs = inputs@{self, nixpkgs, home-manager, nixvim, ...}:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        orpheus = nixpkgs.lib.nixosSystem{
          inherit system;
          specialArgs = {inherit inputs;};
          modules = [./hosts/orpheus/configuration.nix];
        }; 
      };    
      homeConfigurations = {
        "iris@orpheus" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit inputs;};
          modules = [./home-manager/homes/orpheus.nix];
        }; 
      };
    };
}  
