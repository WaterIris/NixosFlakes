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
      setw -g mode-style "fg=#18181b bg=#27272a"

      # panes
      set -g pane-border-style "fg=#27272a"
      set -g pane-active-border-style "fg=#27272a"

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=#83C092"

      set -g status-left "#{?client_prefix,#[bg=#ffffff fg=#27272a],#[bg=#777777 fg=#27272a]}   "
      set -g status-left-length 0

      setw -g window-status-current-style "fg=black bg=red bold"
      setw -g window-status-current-format '#[bg=#18181b fg=#18181b]#{?#{==:#I,1},█,█}#[bg=#27272a fg=#ffffff] #I #W '

      setw -g window-status-separator ""
      setw -g window-status-format '#[bg=#18181b fg=#18181b]#{?#{==:#I,1},█,█}#[bg=#27272a fg=#777777] #I #W '

      set -g status-right "#[bg=#b77ed1 fg=#27272a] #(whoami)@#H "

      setw -g window-status-bell-style "fg=yellow bg=red bold"
      # set -g status-bg "#18181b" 

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
