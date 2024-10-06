# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.btop.enable = true;
  programs.btop.settings = {
    truecolor = true;
    force_tty = false;
    color_theme = "/home/cameron/.config/btop/themes/catppuccin_mocha.theme";
    rounded_corners = true;
    update_ms = 200;
  };
}
