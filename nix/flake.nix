{
  description = "Multi-platform Nix configuration for macOS and Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
    let
      # Shared configuration
      mkUser = username: homeDir: {
        users.users.${username}.home = homeDir;
      };
      
      # Common home-manager configuration
      mkHomeManagerConfig = system:
        let
          isLinux = nixpkgs.lib.hasSuffix "-linux" system;
          homeDir = if isLinux then "/home/nicolas" else "/Users/nicolas";
        in {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nicolas = import ./home {
            inherit system isLinux;
            homeDirectory = homeDir;
            username = "nicolas";
          };
        };
    in
    {
      # macOS (Darwin) configuration
      darwinConfigurations."developer" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/darwin/system.nix
          ./modules/shared/nix-core.nix
          ./modules/shared/custom-apps
          ./modules/darwin/apps.nix
          (mkUser "nicolas" "/Users/nicolas")
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "nicolas";
              autoMigrate = true;
            };
          }
          home-manager.darwinModules.home-manager
          (mkHomeManagerConfig "aarch64-darwin")
        ];
      };

      # Linux (NixOS) configuration
      nixosConfigurations."developer" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/linux/configuration.nix
          ./modules/shared/nix-core.nix
          ./modules/shared/custom-apps
          ./modules/linux/apps.nix
          (mkUser "nicolas" "/home/nicolas")
          home-manager.nixosModules.home-manager
          (mkHomeManagerConfig "x86_64-linux")
        ];
      };

      # Home Manager standalone configuration (for Ubuntu)
      homeConfigurations."nicolas" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./home/default.nix
          {
            home.username = "nicolas";
            home.homeDirectory = "/home/nicolas";
          }
        ];
      };

      # Expose packages
      darwinPackages = self.darwinConfigurations."developer".pkgs;
      nixosPackages = self.nixosConfigurations."developer".pkgs;
    };
}
