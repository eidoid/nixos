{ ... }:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      sway = {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/etc/profiles/per-user/eidoid/bin/sway";
      };
    };
  };
}
