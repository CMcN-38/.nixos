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
    # catppuccin-sddm-corners     # sddm theme 
    clapper                     # play videos
    ffmpegthumbnailer           # video thumbnails
    grim                        # screenshot compontent
    hypridle                    # hyprland idle daemon
    hyprlock                    # hyprland lockscreen
    lxqt.pavucontrol-qt         # audio control component
    pwvucontrol                 # audio control component
    rofi-unwrapped              # app launcher
    slurp                       # screenshot component
    swappy                      # screenshot component
    swaynotificationcenter      # notification center
    swww                        # wallpaper
    waybar                      # taskbar
    xfce.tumbler                # thunar thumbnails
    (where-is-my-sddm-theme.override {
    themeConfig = {
      General = {
        backgroundFill = "#1e1e2e";
        basicTextColor = "#cdd6f4";
        passwordCursorColor = "#cdd6f4";
        passwordInputBackground = "#1e1e2e";
        passwordTextColor = "#cdd6f4";
      };
    };
  })
  ];

  #┓       ┓     ┓
  #┣┓┓┏┏┓┏┓┃┏┓┏┓┏┫
  #┛┗┗┫┣┛┛ ┗┗┻┛┗┗┻
  #   ┛┛

  programs.hyprland = {
    enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # theme = "catppuccin-sddm-corners";
    theme = "where_is_my_sddm_theme";
    extraPackages = with pkgs; [
       kdePackages.qt5compat      # provides Qt5Compat modules
    ];
 };

  programs.thunar.enable = true;        # File Browser
  programs.xfconf.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];

  boot = {

    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = with pkgs; [
        # By default we would install all themes
        (catppuccin-plymouth.override {
          variant = "mocha";
        })
      ];
      # themePackages = with pkgs; [
      #   # By default we would install all themes
      #   (adi1090x-plymouth-themes.override {
      #     selected_themes = [ "rings" ];
      #   })
      # ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

  };
}
