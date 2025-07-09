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
      setw -g clock-mode-colour red
      # setw -g mode-style "fg=#1e1e2e bg=#a6e3a1"

      # panes
      set -g pane-border-style "fg=#313244"
      set -g pane-active-border-style "fg=#313244"

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=#a6e3a1"

      set -g status-left "#{?client_prefix,#[bg=#f9e2af fg=#313244],#[bg=#89b4fa fg=#313244]}  #{?client_prefix,#[bg=#313244 fg=#f9e2af],#[bg=#313244 fg=#89b4fa]}"
      set -g status-left-length 0

      setw -g window-status-current-style "fg=black bg=red bold"
      setw -g window-status-current-format '#[bg=#1e1e2e fg=#313244]#{?#{==:#I,1},█,}#[bg=#313244 fg=#eba0ac] #I #W #[bg=#1e1e2e fg=#313244]'

      setw -g window-status-separator " | "
      setw -g window-status-format '#[bg=#1e1e2e fg=#313244]#{?#{==:#I,1},█,}#[bg=#313244 fg=#89b4fa] #I #W #[bg=#1e1e2e fg=#313244]'

      set -g status-right "#[bg=#1e1e2e fg=#313244]#[bg=#313244 fg=#f9e2af] #(whoami)@#H#[bg=#313244 fg=#313244] "

      setw -g window-status-bell-style "fg=yellow bg=red bold"
      # set -g status-bg "#1e1e2e" 

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
