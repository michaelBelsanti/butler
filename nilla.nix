let
  pins = import ./npins;
  nilla = import pins.nilla;
in
nilla.create {
  config = {
    inputs.nixpkgs.src = pins.nixpkgs;

    shells.default = {
      systems = [ "x86_64-linux" ];
      builder = "nixpkgs";
      shell =
        { mkShell, pkgs, ... }:
        mkShell {
          packages = with pkgs; [
            go
            gopls
          ];
        };
    };
  };
}
