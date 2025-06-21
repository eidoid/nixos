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
      workspaceAutoBackAndForth = true;
      modifier = "Mod4";
      terminal = "foot";
      menu = "fuzzel";
      
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
        "${modifier}+s" = "workspace number 9";
        "${modifier}+Shift+s" = "move container to workspace number 9";
        # "${modifier}+s" = "scratchpad show";
        # "${modifier}+Shift+s" = "move scratchpad";
      } // builtins.listToAttrs (builtins.concatLists (builtins.genList (i:
        let ws = i + 1; in [
          { name = "${modifier}+${toString (i+1)}"; value = "workspace number ${toString ws}"; }
          { name = "${modifier}+Shift+${toString (i+1)}"; value = "move container to workspace number ${toString ws}"; }
        ]
      ) 8));

      input."type:keyboard" = {
        xkb_layout = "us";
        repeat_delay = "200";
      };
      
      input."type:touchpad" = {
        natural_scroll = "enabled";
      };
      
      input."type:pointer" = {
        accel_profile = "adaptive";
        pointer_accel = "-0.6";
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
        border = 5;
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
    extraConfig = ''
      set $rosewater #f2d5cf
      set $flamingo #eebebe
      set $pink #f4b8e4
      set $mauve #ca9ee6
      set $red #e78284
      set $maroon #ea999c
      set $peach #ef9f76
      set $yellow #e5c890
      set $green #a6d189
      set $teal #81c8be
      set $sky #99d1db
      set $sapphire #85c1dc
      set $blue #8caaee
      set $lavender #babbf1
      set $text #c6d0f5
      set $subtext1 #b5bfe2
      set $subtext0 #a5adce
      set $overlay2 #949cbb
      set $overlay1 #838ba7
      set $overlay0 #737994
      set $surface2 #626880
      set $surface1 #51576d
      set $surface0 #414559
      set $base #303446
      set $mantle #292c3c
      set $crust #232634
      set $nothing #ffffff00
      client.focused           $lavender $base $text  $rosewater $lavender
      client.focused_inactive  $overlay0 $base $text  $rosewater $nothing
      client.unfocused         $overlay0 $base $text  $rosewater $nothing
      client.urgent            $peach    $base $peach $overlay0  $peach
      client.placeholder       $overlay0 $base $text  $overlay0  $overlay0
      client.background        $base

      primary_selection disabled
    '';
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
