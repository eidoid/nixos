{ pkgs, ... }:
pkgs.symlinkJoin {
  name = "sway-nvidia";
  paths = [ pkgs.sway ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram "$out/bin/sway" \
      --add-flags "--unsupported-gpu"
  '';
}
