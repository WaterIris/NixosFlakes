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
      # setw -g mode-style "fg=#1e1e2e bg=#83C092"

      # panes
      set -g pane-border-style "fg=#1a2137"
      set -g pane-active-border-style "fg=#1a2137"

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=#83C092"

      set -g status-left "#{?client_prefix,#[bg=#e5c890 fg=#1a2137],#[bg=#56b8f7 fg=#1a2137]}  #{?client_prefix,#[bg=#1a2137 fg=#e5c890],#[bg=#1a2137 fg=#56b8f7]}"
      set -g status-left-length 0

      setw -g window-status-current-style "fg=black bg=red bold"
      setw -g window-status-current-format '#[bg=#101319 fg=#1a2137]#{?#{==:#I,1},█,}#[bg=#1a2137 fg=#f38ba8] #I #W #[bg=#101319 fg=#1a2137]'

      setw -g window-status-separator " | "
      setw -g window-status-format '#[bg=#101319 fg=#1a2137]#{?#{==:#I,1},█,}#[bg=#1a2137 fg=#56b8f7] #I #W #[bg=#101319 fg=#1a2137]'

      set -g status-right "#[bg=#101319 fg=#1a2137]#[bg=#1a2137 fg=#e5c890] #(whoami)@#H#[bg=#1a2137 fg=#1a2137] "

      setw -g window-status-bell-style "fg=yellow bg=red bold"
      # set -g status-bg "#101319" 

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
