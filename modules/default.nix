{ config, ... }:
{
  imports = [
    ./hyprland.nix
    ./utils.nix
    ./vscode.nix
    ./waybar.nix
    ./fcitx5.nix
    ./swaync.nix
    ./yazi.nix
    ./games.nix
    ./foot.nix
    ./sway.nix
    ./neovim.nix
    ./fuzzel.nix
  ];
  home.username = "eidoid";
  home.homeDirectory = "/home/eidoid";
  home.stateVersion = "25.05";
  home.file."${config.xdg.configHome}" = {
    source = ../dotfiles;
    recursive = true;
  };
}
