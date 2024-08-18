{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-24.05;
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = github:hercules-ci/flake-parts;
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-darwin"];
      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
        devShells.default = pkgs.mkShell {
          packages = [pkgs.alejandra];
        };
      };
      flake = let
        module = import ./module.nix;
      in {
        nixosModules.default = module;
        darwinModules.default = module;
      };
    };
}
