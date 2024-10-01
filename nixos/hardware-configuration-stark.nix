{config, lib, pkgs, modulesPath, ...};

{
        imports =
                [ (modulesPath + "/installer/scan/not-detected.nix")
                ];

        boot.initrd.availableKernelModules = ["xhci_pci", "nvme", "usb_storage", "sd_mod"]
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "kvm-intel"];
        boot.extraKernelModules = [];

        fileSystems."/" = 
                { device = "/dev/disk/by-uuid/12bf56e8-af8a-46e4-9d05-1219caef5a9c";
                fsType = "ext4";
                };


        fileSystems."/boot" = 
                { device = "/dev/disk/by-uuid/AA4C-18F6";
                fsType = "vfat";
                };

        swapDevices =
                [ { device = "/dev/disk/by-uuid/d99a6d99-fa15-4a55-a19d-ae99db253bce"; }
                ];

        networking.useDHCP = lib.mkDefault true;

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        }
