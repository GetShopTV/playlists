{ nixpkgs ? import <nixpkgs> { }
, ghc ? nixpkgs.ghc
}:

with nixpkgs;

haskell.lib.buildStackProject {
  name = "playlists";

  buildInputs = [
  ];

  inherit ghc;
}
