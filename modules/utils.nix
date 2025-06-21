{ inputs, config, pkgs, ... }:
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
  home.pointerCursor = {
    # name = "BreezeX-RosePine-Linux";
    # package = pkgs.rose-pine-cursor;
    name = "catppuccin-frappe-lavender-cursors";
    package = pkgs.catppuccin-cursors.frappeLavender;
    size = 24;
    x11 = {
      enable = true;
      # defaultCursor = "BreezeX-RosePine-Linux";
      defaultCursor = "catppuccin-frappe-lavender-cursors";
    };
    gtk.enable = true;
    sway.enable = true;
  };
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
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
    };
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
      if uwsm check may-start && uwsm select; then
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
