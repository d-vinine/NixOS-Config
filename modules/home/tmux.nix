{ pkgs, ... }: {

  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "screen-256color";

    shortcut = "space";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      {
        plugin = catppuccin;
        extraConfig = "set -g @catppuccin_flavor 'mocha'";
      }
    ];

    extraConfig = ''
      # --- VIM SENSE ---
    
      # Act like Vim for copy mode
      setw -g mode-keys vi
    
      # Smart pane switching with awareness of Vim splits.
      # This works with the 'vim-tmux-navigator' plugin.
      bind-key -n 'C-h' select-pane -L
      bind-key -n 'C-j' select-pane -D
      bind-key -n 'C-k' select-pane -U
      bind-key -n 'C-l' select-pane -R

      # Split windows like Vim (v = vertical, h = horizontal)
      # Using -c to stay in the same directory
      bind h split-window -h -c "#{pane_current_path}"
      bind v split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # Kill pane/window WITHOUT confirmation
      bind-key e kill-pane
      bind-key E kill-window

      # Copy mode (Prefix + [)
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
    
      # Resize panes with H, J, K, L (Shift + h/j/k/l)
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Visual Tweaks
      set -g status-position top
    '';
  };
}
