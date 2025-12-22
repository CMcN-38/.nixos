
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
#███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗    ██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗███████╗
#██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
#███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗      ██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗  ███████╗
#╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝      ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝  ╚════██║
#███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗    ██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗███████║
#╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
#
{pkgs, ...}: {
  #            ┓
  #┏┓┏┓┏┓┏┓┏┓┏┓┃
  #┗┫┗ ┛┗┗ ┛ ┗┻┗
  # ┛

  environment.systemPackages = with pkgs; [
    appimage-run
                apprun-cli
    cargo
    clang_18
    espanso-wayland
    gccgo13
    go
    hidapi
    imagemagick
    imagemagickBig
    lua
    libnotify
    logiops
    xorg.libxcb
    # rocmPackages_5.llvm.llvm
                mosh
    networkmanagerapplet
    nodejs_22
    openssl.dev
    pkg-config
    poppler_utils
    pamixer
    playerctl
    (python3.withPackages (ps:
      with ps; [
        requests
        jedi-language-server
        pip
        scipy
        wand
      ]))
    # rustup
        libsForQt5.qt5.qtwayland
    rustc
    syncthing
    tesseract4
    tree-sitter

    wireguard-tools
    wgnord
    wl-clipboard
    zig
  ];

  programs.streamdeck-ui = {
    enable = true;
    autoStart = true; # optional
  };

  #     ┓•
  #┏┓┓┏┏┫┓┏┓
  #┗┻┗┻┗┻┗┗┛

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.pulseaudio.extraConfig = "load-module module-device-manager";
  services.blueman.enable = true;

  services.udisks2.enable = true;
  services.devmon.enable = true; # optional: auto-mount for desktops


  services.tailscale = {
        enable = true;
        };

  programs.ssh = {
        extraConfig = "
                Host stark
                        Hostname 192.168.4.96
                        Port 22
                        User cameron
        ";
        };
}
