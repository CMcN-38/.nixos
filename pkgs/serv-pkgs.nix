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
    go
    hidapi
    lua
    libnotify
    logiops
    networkmanagerapplet
    nodejs_21
    openssl
    poppler_utils
    (python3.withPackages (ps:
      with ps; [
        requests
        jedi-language-server
        pip
      ]))
    rustup
    syncthing
    tesseract4
    tigervnc
    tree-sitter

    # Text Expander
    snippetexpanderd
    snippetexpander
    snippetexpanderx
    snippetexpandergui
    at-spi2-atk

    wireguard-tools
    wl-clipboard
  ];

  programs.streamdeck-ui = {
    enable = true;
    autoStart = true; # optional
  };

  #     ┓•
  #┏┓┓┏┏┫┓┏┓
  #┗┻┗┻┗┻┗┗┛

  # Enable sound.
  sound.enable = true;
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
  services.blueman.enable = true;
}
