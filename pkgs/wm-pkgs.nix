#
#b.             8  8 8888 `8.`8888.      ,8'  ,o888888o.       d888888o.
#888o.          8  8 8888  `8.`8888.    ,8'. 8888     `88.   .`8888:' `88.
#Y88888o.       8  8 8888   `8.`8888.  ,8',8 8888       `8b  8.`8888.   Y8
#.`Y888888o.    8  8 8888    `8.`8888.,8' 88 8888        `8b `8.`8888.
#8o. `Y888888o. 8  8 8888     `8.`88888'  88 8888         88  `8.`8888.
#8`Y8o. `Y88888o8  8 8888     .88.`8888.  88 8888         88   `8.`8888.
#8   `Y8o. `Y8888  8 8888    .8'`8.`8888. 88 8888        ,8P    `8.`8888.
#8      `Y8o. `Y8  8 8888   .8'  `8.`8888.`8 8888       ,8P 8b   `8.`8888.
#8         `Y8o.`  8 8888  .8'    `8.`8888.` 8888     ,88'  `8b.  ;8.`8888
#8            `Yo  8 8888 .8'      `8.`8888.  `8888888P'     `Y8888P ,88P'
#
#
#██╗    ██╗███╗   ███╗    ██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗███████╗
#██║    ██║████╗ ████║    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
#██║ █╗ ██║██╔████╔██║    ██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗  ███████╗
#██║███╗██║██║╚██╔╝██║    ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝  ╚════██║
#╚███╔███╔╝██║ ╚═╝ ██║    ██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗███████║
# ╚══╝╚══╝ ╚═╝     ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
#
{
  config,
  pkgs,
  ...
}: {
  #            ┓
  #┏┓┏┓┏┓┏┓┏┓┏┓┃
  #┗┫┗ ┛┗┗ ┛ ┗┻┗
  # ┛

  environment.systemPackages = with pkgs; [
    pavucontrol

    #Screenshot Tools
    grim
    slurp
    swappy

    rofi-wayland-unwrapped

    swaynotificationcenter
    swww
    waybar

    catppuccin-sddm

    # For Thunar Thumbnails
    xfce.tumbler
  ];

  #┓       ┓     ┓
  #┣┓┓┏┏┓┏┓┃┏┓┏┓┏┫
  #┛┗┗┫┣┛┛ ┗┗┻┛┗┗┻
  #   ┛┛

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];

  services.displayManager.sddm.wayland.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
  };
}
