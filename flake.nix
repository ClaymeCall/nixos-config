{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  } @ inputs: {
    # NVF Neovim config output
    packages."x86_64-linux".nvf =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [./modules/cli/programs/nvf.nix];
      }).neovim;

    nixosConfigurations = {
      # Configuration for VMs
      vm = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./hosts/vm/configuration.nix
          ./hosts/vm/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.nvf
        ];
      };

      # Configuration for Idealis
      idealis = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./hosts/idealis/configuration.nix
          ./hosts/idealis/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.nvf
        ];
      };
    };
  };
}
