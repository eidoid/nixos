{ pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-configtool
        fcitx5-chinese-addons
        fcitx5-gtk
	fcitx5-pinyin-zhwiki
	fcitx5-pinyin-moegirl
	catppuccin-fcitx5
      ];
      settings = {
        globalOptions = {
	  "Hotkey/TriggerKeys" = { "0" = "Super+space"; };
	  "Hotkey/EnumerateGroupForwardKey" = {};
          "Hotkey/EnumerateGroupBackwardKey" = {};
	};
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "pinyin";
          GroupOrder."0" = "Default";
        };
        addons = {
	  classicui.globalSection.Theme = "catppuccin-frappe-sky";
          classicui.globalSection.DarkTheme = "catppuccin-frappe-sky";
          pinyin.globalSection = {
            PageSize = 9;
            CloudPinyinEnabled = "True";
            CloudPinyinIndex = 2;
          };
          cloudpinyin.globalSection = {
            Backend = "Baidu";
          };
        };
      };
    };
  };
}
