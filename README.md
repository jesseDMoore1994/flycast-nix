# flycast-nix

Contained in this project is a flake description of how to build [flycast](https://github.com/flyinghead/flycast). A
 dreamcast emulator. The flake auto-updates using github ci actions to stay up to date with the tip of
 flycast itself.

 To build flycast using nix, you can do the following:
```bash
git clone git@github.com:jesseDMoore1994/flycast-nix.git
cd flycast-nix
nix build .#
```

 Or alternatively, if you simply wish to launch flycast:
```bash
nix run github:jesseDMoore1994/flycast-nix
```
