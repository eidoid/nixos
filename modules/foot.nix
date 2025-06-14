{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = { font = "FiraCode Nerd Font:size=12";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = "0.9";
        foreground = "c6d0f5";
        background = "303446";
        regular0 = "51576d";  # black
        regular1 = "e78284";  # red
        regular2 = "a6d189";  # green
        regular3 = "e5c890";  # yellow
        regular4 = "8caaee";  # blue
        regular5 = "f4b8e4";  # magenta
        regular6 = "81c8be";  # cyan
        regular7 = "b5bfe2";  # white
        bright0 = "626880";   # bright black
        bright1 = "e78284";   # bright red
        bright2 = "a6d189";   # bright green
        bright3 = "e5c890";   # bright yellow
        bright4 = "8caaee";   # bright blue
        bright5 = "f4b8e4";   # bright magenta
        bright6 = "81c8be";   # bright cyan
        bright7 = "a5adce";   # bright white
        "16" = "ef9f76";   # extended color 16
        "17" = "f2d5cf";   # extended color 17
        "selection-foreground" = "c6d0f5";
        "selection-background" = "4f5369";
        "search-box-no-match" = "232634 e78284";
        "search-box-match" = "c6d0f5 414559";
        "jump-labels" = "232634 ef9f76";
        urls = "8caaee";
      };
      cursor = {
        color = "232634 f2d5cf";
      };
    };
  };
}
