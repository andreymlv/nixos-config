{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  inputs.home-manager.url = "gitlab:rycee/home-manager/release-23.05";
  outputs = { self, nixpkgs, home-manager }@inputs: {
    nixosConfigurations.chocolate = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./machines/chocolate/configuration.nix ];
      specialArgs.inputs = inputs;
    };
  };
}
