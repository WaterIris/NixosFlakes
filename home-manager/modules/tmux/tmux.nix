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
      setw -g mode-style "fg=#1e1e2e bg=#bcc6e3"

      # panes
      set -g pane-border-style "fg=#313245"
      set -g pane-active-border-style "fg=#313245"

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=#313245"

      set -g status-left "#{?client_prefix,#[bg=#A6E3A2 fg=#313245],#[bg=#89B4FB fg=#313245]}  #{?client_prefix,#[bg=#313245 fg=#A6E3A2],#[bg=#313245 fg=#89B4FB]}"
      set -g status-left-length 0

      setw -g window-status-current-style "fg=black bg=red bold"
      setw -g window-status-current-format '#[bg=#1e1e2e fg=#313245]#{?#{==:#I,1},█,}#[bg=#313245 fg=#f38ba8] #I #W #[bg=#1E1E2F fg=#313245]'

      setw -g window-status-separator " | "
      setw -g window-status-format '#[bg=#1e1e2e fg=#313245]#{?#{==:#I,1},█,}#[bg=#313245 fg=#89b4fa] #I #W #[bg=#1E1E2F fg=#313245]'

      set -g status-right "#[bg=#1e1e2e fg=#313245]#[bg=#313245 fg=#f9e2af] #(whoami)@#H#[bg=#313245 fg=#313245] "

      setw -g window-status-bell-style "fg=yellow bg=red bold"
      # set -g status-bg "#181825" 

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
