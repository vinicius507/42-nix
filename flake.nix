{
  description = "The 42 School Flake";

  inputs = {
    nixpkgs.url = "nixpkgs";
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
    packages.${system}.norminette = pkgs.norminette;
    overlays = import ./overlays;
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
