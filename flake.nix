{
  description = "A devShell example";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
    toolbox.url      = "github:catppuccin/toolbox";
  };

  outputs = { self, nixpkgs, flake-utils, toolbox, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      with pkgs;
      {
        devShell = mkShell {
          buildInputs = [
            toolbox.packages.${pkgs.system}.whiskers
          ];
        };
      }
    );
}
