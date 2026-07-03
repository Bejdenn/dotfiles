{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd = {
      luks = {
        devices."luks-a7282094-d378-41e9-afa1-e4b887d4470d".device = "/dev/disk/by-uuid/a7282094-d378-41e9-afa1-e4b887d4470d";
        devices."luks-eabc3849-59d4-4e8b-ae32-174e625bad30".device = "/dev/disk/by-uuid/eabc3849-59d4-4e8b-ae32-174e625bad30";
      };

      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
      kernelModules = [];
    };
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  fileSystems."/" = {
    device = "/dev/mapper/luks-eabc3849-59d4-4e8b-ae32-174e625bad30";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A513-5732";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/mapper/luks-a7282094-d378-41e9-afa1-e4b887d4470d";}
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
