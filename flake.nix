{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  inputs.home-manager.url = "gitlab:rycee/home-manager/release-23.05";
  outputs = { self, nixpkgs, home-manager }@inputs: {
    nixosConfigurations.thinkpad-e490 = nixpkgs.lib.nixosSystem {
      modules = [ ./machines/thinkpad-e490/configuration.nix ];
      specialArgs.inputs = inputs;
      system = "x86_64-linux";
    };
  };
}
