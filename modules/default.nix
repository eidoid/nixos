{ ... }:
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
  ];
  home.username = "eidoid";
  home.homeDirectory = "/home/eidoid";
  home.stateVersion = "25.05";
}
