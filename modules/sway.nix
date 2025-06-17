{ config, pkgs, ... }:
let
  sway-nvidia = pkgs.callPackage ./sway-nvidia.nix {};
in
{
  wayland.windowManager.sway = {
    enable = true;
    package = sway-nvidia;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "foot";
      menu = "wmenu-run";
      
      keybindings = {
        "${modifier}+q" = "exec ${terminal}";
        "${modifier}+c" = "kill";
        "${modifier}+m" = "exit";
        "${modifier}+v" = "floating toggle";
        "${modifier}+r" = "exec ${menu}";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+s" = "scratchpad show";
        "${modifier}+Shift+s" = "move scratchpad";
      } // builtins.listToAttrs (builtins.concatLists (builtins.genList (i:
        let ws = i + 1; in [
          { name = "${modifier}+${toString (i+1)}"; value = "workspace number ${toString ws}"; }
          { name = "${modifier}+Shift+${toString (i+1)}"; value = "move container to workspace number ${toString ws}"; }
        ]
      ) 9));

      input."type:keyboard" = {
        xkb_layout = "us";
        repeat_delay = "200";
        accel_profile = "adaptive";
      };
      
      input."type:touchpad" = {
        natural_scroll = "enabled";
      };
      
      input."epic-mouse-v1" = {
        pointer_accel = "-0.5";
      };
      output."*" = {
        scale = "1";
      };
      seat."*" = {
        hide_cursor = "when-typing enable";
      };
      
      gaps = {
        inner = 1;
        outer = 1;
      };

      bars = [
        {
          command = "waybar";
	  position = "top";
	}
      ];
      
      window = {
        border = 2;
        titlebar = false;
        commands = [
          { command = "floating enable"; criteria = { app_id = "QQ"; }; }
          { command = "resize set width 1280 height 720"; criteria = { app_id = "QQ"; }; }
          { command = "floating enable"; criteria = { app_id = "wechat"; }; }
          { command = "resize set width 1280 height 720"; criteria = { app_id = "wechat"; }; }
          { command = "floating enable"; criteria = { title = "公众号"; }; }
          { command = "floating enable"; criteria = { title = "微信"; }; }
          { command = "resize set width 1280 height 720"; criteria = { title = "微信"; }; }
          { command = "floating enable"; criteria = { app_id = "pavucontrol"; }; }
          { command = "resize set width 860 height 540"; criteria = { app_id = "pavucontrol"; }; }
          { command = "floating enable"; criteria = { app_id = "clash-verge"; }; }
          { command = "resize set width 1280 height 720"; criteria = { app_id = "clash-verge"; }; }
          { command = "floating enable"; criteria = { app_id = "Waydroid"; }; }
        ];
      };
      
      startup = [
        { command = "fcitx5"; }
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
