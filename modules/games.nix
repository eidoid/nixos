{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.aagl.packages.${pkgs.system}.the-honkers-railway-launcher
    inputs.aagl.packages.${pkgs.system}.wavey-launcher
    (pkgs.callPackage "${inputs.eidoid}/pkgs/my-dystopian-robot-girlfriend" {})
  ];
}
