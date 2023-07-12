{ config, pkgs, lib, ... }:{
  environment.systemPackages = with pkgs; [
    alacritty
    wayland
    xdg-utils
    gnome3.adwaita-icon-theme
    swaylock
    swayidle
    grim
    slurp
    wl-clipboard
    wofi
    mako
    light
    waybar
    gammastep
    pulsemixer
    sway-contrib.grimshot
  ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
