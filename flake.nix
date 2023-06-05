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
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        bear
        clang-tools_12
        gnumake
        llvmPackages_12.libcxxClang
        norminette
        valgrind
      ];
      shellHook = ''
        cat << EOF
        Welcome to the École 42 development environment!

                :::      ::::::::
              :+:      :+:    :+:
            +:+ +:+         +:+
          +#+  +:+       +#+
        +#+#+#+#+#+   +#+
            #+#    #+#
            ###   ########
        EOF
      '';
    };
  };
}
