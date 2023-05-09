{
  description = "École 42 development enviroment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        python-pkgs = ps: with ps; [
          (buildPythonPackage rec {
            pname = "norminette";
            version = "3.3.51";
            src = fetchPypi {
              inherit pname version;
              sha256 = "7ed0cbd125e2dc0f776ac274d22bdbc9fcea5cfb0e7797e1d6ba8fcf58894771";
            };
            doCheck = false;
          })
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            bear
            clang-tools_12
            gnumake
            llvmPackages_12.libcxxClang
            valgrind
            (python3.withPackages python-pkgs)
          ];
          shellHook = ''
            echo "Welcome to 42 development environment!"
            cat << EOF
                    :::      ::::::::
                  :+:      :+:    :+:
                +:+ +:+         +:+
              +#+  +:+       +#+
            +#+#+#+#+#+   +#+
                #+#    #+#
                ###   ########.fr
            EOF
          '';
        };
      });
}
