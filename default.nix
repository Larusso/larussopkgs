{ system ? builtins.currentSystem }:
let pkgs = import <nixpkgs> { inherit system; };

in {
  unityhub = pkgs.callPackage ./pkgs/development/tools/unityhub {
    stdenv = pkgs.stdenv;
    fetchurl = pkgs.fetchurl;
    appimageTools = pkgs.appimageTools;
    gsettings-desktop-schemas = pkgs.gsettings-desktop-schemas;
    gtk3 = pkgs.gtk3;
    undmg = pkgs.undmg;
  };
}
