{config, lib, ...}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings ={
      add_newline = false;
      directory = {
        truncation_length = 0;
        truncate_to_repo = false;
      };
      character = {
        success_symbol = "[](#56b8f7)";
        error_symbol = "[](#fb80aa)";
      };

      git_branch = {
        symbol = "  ";
      };

      git_commit = {
        tag_symbol = " ";
      };

      format = lib.concatStrings [
      "$hostname"
      "$directory"
      "$git_branch"
      "$git_commit"
      "$git_state"
      "$git_metrics"
      "$git_status"
      # "$nix_shell"
      "$line_break"
      "$character"
      ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vi = "nvim";     
      cd = "z";
      ls = "eza";
      ll = "eza -alh";
      tree = "eza --tree";
      tt = "~/.config/tmux/script.sh";

    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
