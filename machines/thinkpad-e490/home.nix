{ config, pkgs, inputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModule
    ];

  home-manager.users.andreymlv = { pkgs, ... }: {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "andreymlv";
    home.homeDirectory = "/home/andreymlv";

    # Packages that should be installed to the user profile.
    home.packages = [                               
      pkgs.htop
      pkgs.fortune
    ];

    programs.git = {
      enable = true;
      userName = "andreymlv";
      userEmail = "ndrmlv@ya.ru";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "23.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
