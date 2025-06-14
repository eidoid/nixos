{ config, pkgs, ... }:
let
  wallpaper = pkgs.fetchurl {
    url = "https://cdn.donmai.us/original/e9/19/e9199ecc7b52b51b1887c6939814822d.jpg";
    hash = "sha256-Iqcw2w/WiMgqynPtwnke5VUpd6PPOUaYo9/NebKvJgs=";
  };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      "$mainMod" = "SUPER";
      "$term" = "foot";
      "$menu" = "wmenu-run";
      bind = [
        "$mainMod, Q, exec, $term"
        "$mainMod, C, killactive"
        "$mainMod, M, exit"
        "$mainMod, V, togglefloating"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, exec, hyprshot -m region"
        "$mainMod SHIFT, P, exec, sleep 2 && hyprshot -m region --freeze"
        "$mainMod, F, fullscreen"
        #"$mainMod, J, togglesplit"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ] ++ (builtins.concatLists(builtins.genList(i:
        let ws = i + 1;
	in [
	  "$mainMod, code:1${toString i}, workspace, ${toString ws}"
	  "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	]
      )9));
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      monitor = ",preferred,auto,1.2";
      exec-once = [
        "waybar"
	"fcitx5"
      ];
      cursor.no_hardware_cursors = 1;
      xwayland.force_zero_scaling = true;
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        layout = "dwindle";
        allow_tearing = true;
      };
      decoration = {
        rounding = 0;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
           enabled = true;
           range = 4;
           render_power = 3;
           color = "rgba(1a1a1aee)";
        };
        blur = {
           enabled = true;
           size = 3;
           passes = 1;
           vibrancy = 0.1696;
        };
      };
      animations.enabled = false;
      dwindle = {
         pseudotile = true;
         preserve_split = true;
      };
      master = {
         new_status = "master";
      };
      misc = {
         disable_hyprland_logo = true;
	 disable_splash_rendering = true;
	 middle_click_paste = false;
      };
      input = {
         kb_layout = "us";
         follow_mouse = 1;
         follow_mouse_threshold = 50;
         sensitivity = -0.4;
	 repeat_delay = 200;
	 accel_profile = "adaptive";
         touchpad = {
            natural_scroll = false;
         };
      };
      gestures = {
         workspace_swipe = false;
      };
      device = {
         name = "epic-mouse-v1";
         sensitivity = -0.5;
      };
      windowrule = [
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
	"float,class:QQ"
	"size 1280 720,class:QQ,title:QQ"
	"float,class:wechat"
	"size 1280 720,class:wechat"
	"float,class:^$,title:公众号"
	"float,class:^$,title:微信"
	"size 1280 720,class:^$,title:微信"
	"float,class:org.pulseaudio.pavucontrol"
	"size 860 540,class:org.pulseaudio.pavucontrol"
	"float,class:clash-verge"
	"size 1280 720,class:clash-verge"
	"float,class:Waydroid"
	"float,class:chrome-[a-z]{32}-Default"
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        (builtins.toString wallpaper)
      ];
      wallpaper = [
        ",${builtins.toString wallpaper}"
      ];
    };
  };
  services.hyprpolkitagent.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
