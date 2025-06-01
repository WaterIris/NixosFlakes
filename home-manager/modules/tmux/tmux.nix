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
      
      #  modes
      setw -g clock-mode-colour red
      setw -g mode-style "fg=#1a2137 bg=#bcc6e3"

      # panes
      set -g pane-border-style "fg=#2e3859"
      set -g pane-active-border-style "fg=#2e3859"

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=red"

      set -g status-left "#{?client_prefix,#[bg=#1a2137 fg=#e5c890],#[bg=#1a2137 fg=#56b8f7]}  #[bg=#101320 fg=#1a2137]#[bg=#101319 fg=#101319] "
      set -g status-left-length 0

      setw -g window-status-current-style "fg=black bg=red bold"
      setw -g window-status-current-format '#[bg=#101320 fg=#1a2137]#[bg=#1a2137 fg=#fb80aa] #I #W #[bg=#101320 fg=#1a2137]'

      setw -g window-status-style "fg=red"
      setw -g window-status-separator " "
      setw -g window-status-format '#[bg=#101320 fg=#1a2137]#[bg=#1a2137 fg=#bcc6e3] #I #W #[bg=#101320 fg=#1a2137]'

      set -g status-right "#[bg=#101320 fg=#1a2137]#[bg=#1a2137 fg=#b77ed1] #H #[bg=#101320 fg=#1a2137]"

      setw -g window-status-bell-style "fg=yellow bg=red bold"

      # messages
      set -g message-style "fg=yellow bg=terminal bold"    
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.sensible;
      }
      {
        plugin = tmuxPlugins.resurrect; 
      }
    ];
  };
}
