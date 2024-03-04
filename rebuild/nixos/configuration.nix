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
    ./hardware-configuration.nix
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

  system.stateVersion = "23.11"; # Did you read the comment?

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

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

  #┓┏┏┏┓┏┓┏
  #┗┻┛┗ ┛ ┛

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cameron = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  };

  #┓                           •
  #┣┓┏┓┏┳┓┏┓━━┏┳┓┏┓┏┓┏┓┏┓┏┓┏┓  ┓┏┳┓┏┓┏┓┏┓╋
  #┛┗┗┛┛┗┗┗   ┛┗┗┗┻┛┗┗┻┗┫┗ ┛   ┗┛┗┗┣┛┗┛┛ ┗
  #                     ┛          ┛

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "cameron" = import ../home-manager/home.nix;
    };
  };

  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};
}
