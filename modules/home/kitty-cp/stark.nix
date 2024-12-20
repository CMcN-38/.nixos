# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.kitty.enable = true;
  programs.kitty.shellIntegration.enableZshIntegration = true;

  programs.kitty.font.name = "FiraCode Nerd Font";
  programs.kitty.font.size = 14;

  programs.kitty.themeFile = "Catppuccin-Mocha";

  programs.kitty.settings = {
    enable_audio_bell = false;
    confirm_os_window_close = 0;

    background_opacity = "0.85";
    background_tint = "0.0";

    # startup_session = "launch.conf";
    startup_session = "/home/cameron/.nixos/modules/home/kitty/launch.conf";
  };
}
