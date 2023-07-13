{ inputs, ... }:

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
      curl
      fd
      htop
      inetutils
      lazygit
      neofetch
      nnn
      ripgrep
      trashy
      wget

      # Archives
      atool
      p7zip
      unrar
      unzip

      # Neovim
      luajitPackages.jsregexp
      neovim
      nodePackages.neovim
      python311Packages.pynvim

      # LSP and formatters
      lua-language-server
      stylua
      clang-tools
      nil
      nixpkgs-fmt
      cmake-language-server
      cmake-format

      # Programming
      cargo
      cmake
      cppcheck
      gcc
      git
      gnumake
      man-pages
      man-pages-posix
      mold

      # Internet
      discord
      firefox
      telegram-desktop
      transmission
      wireguard-tools

      # Multimedia
      imv
      keepassxc
      mpd
      mpv
      ncmpcpp
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
