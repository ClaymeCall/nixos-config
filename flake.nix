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
    packages.x86_64-linux.nvf =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./modules/cli/programs/nvf.nix];
      }).neovim;

    # NVF Neovim config output for WSL
    packages.x86_64-linux.nvf_wsl =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./modules/cli/programs/nvf.nix];
      }).neovim;

    # Optional default
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.nvf_wsl;

    nixosConfigurations = {
      # Configuration for VMs
      vm_vb = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./hosts/vm_vb/configuration.nix
          ./hosts/vm_vb/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.nvf
        ];
      };

      vm_qemu = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./hosts/vm_qemu/configuration.nix
          ./hosts/vm_qemu/hardware-configuration.nix
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
