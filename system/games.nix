{ ... }:
{
  networking.hosts = {
    "0.0.0.0" = [ "public-data-api.mihoyo.com" "log-upload.mihoyo.com" "pc.crashsight.wetest.net" ];
  };
}
