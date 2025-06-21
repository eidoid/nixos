{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc-icons
        catppuccin.catppuccin-vsc
	vscodevim.vim
      ];
      userSettings = {
        "workbench.colorTheme" = "Catppuccin Frappé";
        "workbench.iconTheme" = "catppuccin-frappe";
      };
    };
  };
}
