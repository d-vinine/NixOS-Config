{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "FiraCode Nerd Font";
      font-size = 12;
      background-opacity = 0.8;
      background-blur = true;
      window-decoration = false;
      confirm-close-surface = false;
      keybind = [
        "ctrl+shift+t=new_tab"
        "ctrl+shift+w=close_tab"
        "super+ctrl+f=toggle_fullscreen"
      ];
    };
  };

  # Set as default for GNOME
  dconf.settings = {
    "org/gnome/desktop/applications/terminal" = {
      exec = "ghostty";
    };
  };
}
