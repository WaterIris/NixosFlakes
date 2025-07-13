{pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    baseIndex = 1;
    terminal = "screen-256color";
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
      
      #  modes
      # setw -g clock-mode-colour red
      setw -g mode-style "fg=#292a37 bg=#44465c"

      # panes
      set -g pane-border-style "fg=#44465c"
      set -g pane-active-border-style "fg=#44465c"

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=#83C092"

      # set -g status-left "#{?client_prefix,#[bg=#e5c890 fg=#303241],#[bg=#56b8f7 fg=#303241]}   #{?client_prefix,#[#303241 fg=#e5c890],#[bg=#303241 fg=#56b8f7]}█"
      set -g status-left "#{?client_prefix,#[bg=#d9e0ee fg=#303241],#[bg=#9699b7 fg=#303241]}   "
      set -g status-left-length 0

      setw -g window-status-current-style "fg=black bg=red bold"
      setw -g window-status-current-format '#[bg=#292a37 fg=#292a37]#{?#{==:#I,1},█,█}#[bg=#44465c fg=#d9e0ee] #I #W '

      setw -g window-status-separator ""
      setw -g window-status-format '#[bg=#292a37 fg=#292a37]#{?#{==:#I,1},█,█}#[bg=#44465c fg=#9699b7] #I #W '

      set -g status-right "#[bg=#44465c fg=#44465c]█#[bg=#44465c fg=#b77ed1]#(whoami)@#H#[bg=#44465c fg=#44465c] "

      setw -g window-status-bell-style "fg=yellow bg=red bold"
      # set -g status-bg "#292a37" 

      # messages
      set -g message-style "fg=yellow bg=terminal bold"    
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.sensible;
      }
    ];
  };

  home.file.".config/tmux/script.sh" = {
    source = ./tmux_start.sh;
  };
}
