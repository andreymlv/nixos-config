{ modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/1560b5d0-af0c-45c2-ac46-4d50015ac3e7";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/23AA-C2DA";
      fsType = "vfat";
    };


  fileSystems."/hdd" =
    {
      device = "/dev/disk/by-uuid/d05bc209-eb54-4688-b2a7-373ee8d9d2bc";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/83d180ff-f3bd-4839-8da4-d3852273ee8c"; }];

  nixpkgs.hostPlatform = "x86_64-linux";
  powerManagement.cpuFreqGovernor = "perfomance";
  hardware.cpu.intel.updateMicrocode = true;
}
