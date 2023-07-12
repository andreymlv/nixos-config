{ config, pkgs, inputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModule
    ];

  home-manager.users.andreymlv = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    home.username = "andreymlv";
    home.homeDirectory = "/home/andreymlv";

    home.packages = with pkgs; [
      # Terminal
      htop
      neofetch
      wget
      curl
      nnn
      lazygit

      # Archives
      atool
      p7zip
      unrar

      # Neovim
      neovim
      python311Packages.pynvim
      nodePackages.neovim
      luajitPackages.jsregexp
      git
      gnumake
      fd
      ripgrep
      trashy
      unzip
      stylua

      # Programming
      gcc
      cmake
      clang-tools
      cppcheck
      mold
      man-pages
      man-pages-posix
      cargo

      # Internet
      firefox
      telegram-desktop
      discord
      transmission
      wireguard-tools

      # Multimedia
      mpd
      ncmpcpp
      keepassxc
      mpv
      imv
      zathura

      # Office
      libreoffice
      hunspell
      hunspellDicts.en_US
      hunspellDicts.ru_RU
    ];

    programs.git = {
      enable = true;
      userName = "andreymlv";
      userEmail = "ndrmlv@ya.ru";
    };

    programs.mpv = {
      enable = true;
      config.hwdec = "auto";
    };

    home.pointerCursor = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 24;
      x11 = {
        enable = true;
        defaultCursor = "Adwaita";
      };
    };
    
    home.stateVersion = "23.05";

    programs.home-manager.enable = true;
  };
}
