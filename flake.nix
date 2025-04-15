{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # Configuration for the VM
      vm = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
	  ./vm/hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
        ];
      };

      # Configuration for Idealis
      # idealis = nixpkgs.lib.nixosSystem {
      #   specialArgs = {inherit inputs;};
      #   modules = [
      #     ./configuration.nix
      #     ./idealis/hardware-configuration.nix
      #     inputs.home-manager.nixosModules.default
      #   ];
      # };
    };
  };
}
