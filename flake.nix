{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs/staging-next";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    u-boot-src = {
      flake = false;
      url = "https://ftp.denx.de/pub/u-boot/u-boot-2024.07.tar.bz2";
    };
    rpi-linux-6_6_47-src = {
      flake = false;
      url = "github:raspberrypi/linux/rpi-6.6.y";
    };
    rpi-linux-6_10_8-src = {
      flake = false;
      url = "github:raspberrypi/linux/rpi-6.10.y";
    };
    rpi-firmware-src = {
      flake = false;
      url = "github:raspberrypi/firmware/1.20240902";
    };
    rpi-firmware-nonfree-src = {
      flake = false;
      url = "github:RPi-Distro/firmware-nonfree/bookworm";
    };
    rpi-bluez-firmware-src = {
      flake = false;
      url = "github:RPi-Distro/bluez-firmware/bookworm";
    };
    rpicam-apps-src = {
      flake = false;
      url = "github:raspberrypi/rpicam-apps/v1.5.1";
    };
    libcamera-src = {
      flake = false;
      url = "github:raspberrypi/libcamera/69a894c4adad524d3063dd027f5c4774485cf9db"; # v0.3.1+rpt20240906
    };
    libpisp-src = {
      flake = false;
      url = "github:raspberrypi/libpisp/v1.0.7";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    pinned = import inputs.nixpkgs {
      system = "aarch64-linux";
      overlays = with self.overlays; [core libcamera];
    };
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.targaryen = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./nixos/configuration-targaryen.nix
        inputs.home-manager.nixosModules.default
      ];
    };
    nixosConfigurations.stark = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./nixos/configuration-stark.nix
        inputs.home-manager.nixosModules.default
      ];
    };
    # For RPI
    overlays = {
      core = import ./overlays (builtins.removeAttrs inputs ["self"]);
      libcamera = import ./overlays/libcamera.nix (builtins.removeAttrs inputs ["self"]);
    };
    nixosModules.raspberry-pi = import ./rpi {
      inherit pinned;
      core-overlay = self.overlays.core;
      libcamera-overlay = self.overlays.libcamera;
    };
    nixosConfigurations.hightower = nixpkgs.lix.nixosSystem {
      system = "aarch64-linux";
      modules = [self.nixosModules.raspberry-pi ./nixos/configuration-hightower.nix];
    };
    checks.aarch64-linux = self.packages.aarch64-linux;
    packages.aarch64-linux = with pinned.lib; let
      kernels =
        foldlAttrs f {} pinned.rpi-kernels;
      f = acc: kernel-version: board-attr-set:
        foldlAttrs
        (acc: board-version: drv:
          acc
          // {
            "linux-${kernel-version}-${board-version}" = drv;
          })
        acc
        board-attr-set;
    in
      {
        hightower-sd-image = self.nixosConfigurations.hightower.config.system.build.sdImage;
        firmware = pinned.raspberrypifw;
        libcamera = pinned.libcamera;
        wireless-firmware = pinned.raspberrypiWirelessFirmware;
        uboot-rpi-arm64 = pinned.uboot-rpi-arm64;
      }
      // kernels;
  };
}
