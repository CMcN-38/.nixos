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

  #            ┓ •
  #┏┓┏┓╋┓┏┏┏┓┏┓┃┏┓┏┓┏┓
  #┛┗┗ ┗┗┻┛┗┛┛ ┛┗┗┛┗┗┫
  #                  ┛

  networking.hostName = "targaryen"; # Define your hostname.

  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  #┓┏┏┏┓┏┓┏
  #┗┻┛┗ ┛ ┛

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cameron = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  };

  programs.zsh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "cameron" = import ../home-manager/home.nix;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
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

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  #  system.autoUpgrade = {
  #	enable = true;
  #	flake = inputs.self.outPath;
  #	flags = [
  #		"--update-input"
  #		"nixpkgs"
  #		"-L"
  #	];
  #	dates = "09:00";
  #	randomizedDelaySec = "45min";
  #	};
}
