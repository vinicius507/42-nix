{
  description = "The 42 School Flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/release-23.05";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = builtins.attrValues self.overlays;
    };
  in {
    apps.${system}.norminette = {
      type = "app";
      program = "${pkgs.norminette}/bin/norminette";
    };
    packages.${system} = {
      minilibx = import ./pkgs/minilibx.nix {
        inherit (pkgs) lib fetchFromGitHub;
        inherit (pkgs.xorg) libX11 libXext;
        inherit (pkgs.llvmPackages_12) stdenv;
      };
      norminette = import ./pkgs/norminette.nix {
        inherit (pkgs.python3Packages) buildPythonPackage fetchPypi;
      };
    };
    overlays = {
      minilibx = final: _: {
        minilibx = self.packages.${final.system}.minilibx;
      };
      norminette = final: _: {
        norminette = self.packages.${final.system}.norminette;
      };
    };
    templates = rec {
      default = standard;
      minimal = {
        path = ./templates/minimal;
        description = "A 42 School project";
      };
      standard = {
        path = ./templates/standard;
        description = "A 42 School project";
      };
    };
  };
}
