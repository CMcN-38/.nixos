# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.mpv.enable = true;
  programs.mpv.config = {
    image-display-duration = 20;
  };
}
