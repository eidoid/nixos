{ ... }:
{
  programs.yazi = {
    enable = true;
    settings = {
      tasks = {
        image_bound = [ 65535 65535 ];
      };
    };
  };
}
