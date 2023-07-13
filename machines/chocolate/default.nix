{ pkgs, inputs, ... }: {
  imports =
    [
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-intel
      inputs.hardware.nixosModules.common-pc-laptop
      inputs.hardware.nixosModules.common-pc-laptop-ssd
      inputs.hardware.nixosModules.common-pc-laptop-hdd
      
      ./hardware-configuration.nix

      ../common/global

      ../common/optional/pipewire.nix
      ../common/optional/sway.nix
      ../common/optional/printing.nix

      ./home.nix
    ];

  networking = {
    hostName = "chocolate";
    # wireless.enable = true;
    networkmanager.enable = true;
    firewall.enable = false;
    firewall.checkReversePath = false;
  };

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users.users.andreymlv = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" "networkmanager" ];
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  documentation.dev.enable = true;

  environment.localBinInPath = true;

  system.stateVersion = "23.05";
}
