{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    pipes
    kitty-themes
    wl-clipboard
    btop
    qt5.qtwayland
    qt6.qtwayland
    nerd-fonts.fira-code
    wqy_zenhei
    wmenu
    qq
    wechat-uos
    pavucontrol
    hyprshot
  ];
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    themeFile = "Catppuccin-Frappe";
    settings = {
      background_opacity = 0.9;
    };
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number relativenumber
    '';
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting "nice day."
    '';
  };
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "pfnededegaaopdmhkdmcofjmoldfiped"; }
      { id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; }
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
    ];
    commandLineArgs = [
      "--enable-blink-features=MiddleClickAutoscroll"
      "--test-type"
    ];
  };
  programs.fastfetch = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "eidoid";
    userEmail = "moyoka@hnu.edu.cn";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
  programs.bash = {
    enable = true;
    initExtra = ''
      if uwsm check may-start; then
        exec uwsm start default 
      fi
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
