{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };

  stdenv = pkgs.stdenv;
  fetchurl = pkgs.fetchurl;
  appimageTools = pkgs.appimageTools;
  gsettings-desktop-schemas = pkgs.gsettings-desktop-schemas;
  gtk3 = pkgs.gtk3;
  undmg = pkgs.undmg;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  makeWrapper = pkgs.makeWrapper;

in {
  unityhub = pkgs.callPackage ./pkgs/development/tools/unityhub {
    inherit stdenv fetchurl appimageTools gsettings-desktop-schemas gtk3 undmg;
  };

  gdub = pkgs.callPackage ./pkgs/development/tools/build-manager/gdub {
    inherit stdenv fetchFromGitHub makeWrapper;
  };
}
