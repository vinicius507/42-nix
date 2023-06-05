{
  description = "École 42 development enviroment";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    overlays = import ./overlays;
    pkgs = import nixpkgs {
      inherit system;
      overlays = [overlays.norminette];
    };
  in {
    apps.${system}.norminette = {
      type = "app";
      program = "${pkgs.norminette}/bin/norminette";
    };
    packages.${system}.norminette = pkgs.norminette;
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        bear
        clang-tools_12
        gnumake
        llvmPackages_12.libcxxClang
        valgrind
        norminette
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
