{pkgs}:
pkgs.python3.withPackages (ps:
    with ps; [
      (buildPythonPackage rec {
        pname = "norminette";
        version = "3.3.51";
        src = fetchPypi {
          inherit pname version;
          sha256 = "7ed0cbd125e2dc0f776ac274d22bdbc9fcea5cfb0e7797e1d6ba8fcf58894771";
        };
        doCheck = false;
      })
    ])
