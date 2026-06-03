{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/mapper/luks-cf4a9bca-59cf-44d0-a9b0-42bc80cdb01e";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-cf4a9bca-59cf-44d0-a9b0-42bc80cdb01e".device =
    "/dev/disk/by-uuid/cf4a9bca-59cf-44d0-a9b0-42bc80cdb01e";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/83C0-B025";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
