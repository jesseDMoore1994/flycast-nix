{
  description = "A Flake for the Flycast Dreamcast Emulator";
  inputs = {
    flycast-src = {
      url = "https://github.com/flyinghead/flycast.git";
      type = "git";
      submodules = true;
      flake = false;
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, flycast-src }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree {
          flycast = pkgs.stdenv.mkDerivation {
            pname = "flycast";
            version = flycast-src.rev;
            src = flycast-src;
            buildInputs = [
              pkgs.cmake
              pkgs.SDL2.all
              pkgs.curl
              pkgs.mesa
              pkgs.glfw
            ];
            buildPhase = ''
              cmake .
              make
            '';
          };
        };
        defaultPackage = packages.flycast;
        apps.flycast = flake-utils.lib.mkApp { drv = packages.flycast; };
        defaultApp = apps.flycast;
      }
    );
}
