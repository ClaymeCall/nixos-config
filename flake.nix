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
      # Configuration for the VM on Legion
      vm_legion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/vm_legion/configuration.nix
	  ./hosts/vm_legion/hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
        ];
      };

      # Configuration for the VM on Ideapad
      vm_idea = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/vm_idea/configuration.nix
	  ./hosts/vm_idea/hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
        ];
      };

      # Configuration for Idealis
      idealis = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./idealis/configuration.nix
          ./idealis/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
