{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "gitlab:rycee/home-manager/release-23.05";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # Main laptop
      chocolate = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./machines/chocolate ];
        specialArgs = { inherit inputs; };
      };
      # Family pc
      fox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./machines/fox ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
