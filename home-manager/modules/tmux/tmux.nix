{pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      set -s escape-time 1
      set -g status-interval 1    
      set -g default-terminal "kitty"

      # remap prefix from 'C-b' to 'C-a'
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix
      

      # split panes using | and -
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # don't rename windows automatically
      set-option -g allow-rename off

      # enable vi mode keys
      set-window-option -g mode-keys vi

      # set default terminal mode to 256 colors
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",xterm-256color:Tc"
      
      # DESIGN TWEAKS

      #  modes
      setw -g clock-mode-colour yellow
      setw -g mode-style "fg=black bg=red bold"

      # panes
      set -g pane-border-style "fg=red"
      set -g pane-active-border-style "fg=blue"

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=red"

      set -g status-left "#{?client_prefix,#[bg=#2e3859 fg=#fb80aa],#[bg=#2e3859 fg=#e7ebf6]}   #[bg=#101320 fg=#2e3859]"
      set -g status-left-length 0


      set -g status-right-style "fg=black bg=yellow"
      set -g status-right "#[bg=#101319 fg=#2e3859]#[bg=#2e3859 fg=#e7ebf6] %d-%m-%Y #[bg=#2e3859 fg=#101319]"

      setw -g window-status-current-style "fg=black bg=red bold"
      setw -g window-status-current-format '#[bg=blue fg=#101320]#[bg=blue fg=#101319] #I #W #[bg=#101319 fg=blue]#[bg=#101319 fg=blue]'

      setw -g window-status-style "fg=red"
      setw -g window-status-separator ""
      setw -g window-status-format "#[bg=#101319 fg=blue] #I #[fg=blue]#W "

      setw -g window-status-bell-style "fg=yellow bg=red bold"

      # messages
      set -g message-style "fg=yellow bg=terminal bold"    
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.sensible;
      }
    ];
  };

  home.file.".config/tmux/tmux_start.sh" = {
    source = ./tmux_start.sh;
  };
}
