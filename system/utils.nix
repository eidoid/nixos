{ inputs, pkgs, ... }:
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };
  programs.proxychains = {
    enable = true;
    quietMode = true;
    proxies = {
      phone = {
        enable = true;
        type = "socks5";
	host = "127.0.0.1";
	port = 7890;
      };
    };
  };
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
