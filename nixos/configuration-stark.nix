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
# ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ██╗   ██╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
#██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██║   ██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
#██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗██║   ██║██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║
#██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║██║   ██║██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
#╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
# ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
#
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  #•
  #┓┏┳┓┏┓┏┓┏┓╋┏
  #┗┛┗┗┣┛┗┛┛ ┗┛
  #    ┛

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration-stark.nix
    inputs.home-manager.nixosModules.default

    # Packages:
    ../pkgs/gui-pkgs.nix
    ../pkgs/serv-pkgs.nix
    ../pkgs/term-pkgs.nix
    ../pkgs/wm-pkgs.nix
    ../pkgs/fonts.nix
  ];

  #┓      ┓     ┓
  #┣┓┏┓┏┓╋┃┏┓┏┓┏┫┏┓┏┓
  #┗┛┗┛┗┛┗┗┗┛┗┻┗┻┗ ┛

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #  •         •
  #┏┓┓┓┏  ┏┏┓╋╋┓┏┓┏┓┏
  #┛┗┗┛┗  ┛┗ ┗┗┗┛┗┗┫┛
  #                ┛

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # Did you read the comment?

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
  # hardware.keyboard.zsa.enable = true;

  #            ┓ •
  #┏┓┏┓╋┓┏┏┏┓┏┓┃┏┓┏┓┏┓
  #┛┗┗ ┗┗┻┛┗┛┛ ┛┗┗┛┗┗┫
  #                  ┛

  networking.hostName = "targaryen"; # Define your hostname.

  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  services.openssh = {
    enable = true;
    settings.PubkeyAuthentication = true;
    settings.PasswordAuthentication = true;
  };

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [1373];
  #networking.firewall.allowedUDPPorts = [1373];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  networking.useDHCP = false;
  networking.interfaces.wlp1s0.ipv4.addresses = [
    {
      address = "192.168.0.119";
      prefixLength = 24;
    }
  ];
  networking.defaultGateway = "192.168.0.1";
  networking.nameservers = ["8.8.8.8"];

  #┓┏┏┏┓┏┓┏
  #┗┻┛┗ ┛ ┛

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cameron = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel" "input"]; # Enable ‘sudo’ for the user.
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="1220", ATTR{idProduct}=="8fe4", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="1220", ATTR{idProduct}=="8fe0", TAG+="uaccess"
  '';

  # environment.etc = {
  #   "xdg/user-dirs.defaults".text = ''
  #     DOWNLOADS=../../../../../home/cameron/3_downloads
  #   '';
  # };

  environment.sessionVariables = {
    XDG_DOWNLOAD_DIR = "/home/cameron/3_downloads/";
    XDG_DESKTOP_DIR = "/home/cameron/2_desktop/";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  #┓
  #┣┓┏┓┏┳┓┏┓━━┏┳┓┏┓┏┓┏┓┏┓┏┓┏┓  ┓┏┳┓┏┓┏┓┏┓╋
  #┛┗┗┛┛┗┗┗   ┛┗┗┗┻┛┗┗┻┗┫┗ ┛   ┗┛┗┗┣┛┗┛┛ ┗
  #                     ┛          ┛

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "cameron" = import ../home-manager/home-stark.nix;
    };
  };
}
