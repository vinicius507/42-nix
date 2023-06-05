{
  norminette = final: prev: {
    norminette = import ../pkgs/norminette.nix {pkgs = final;};
  };
}
