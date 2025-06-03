{...}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      include = "colors.conf"; 
      # Fonts
      font_family = "JetBrainsMono Nerd Font";
      # font_family = "CaskaydiaCove Nerd Font";
      italic_font = "auto";
      bold_font = "auto";
      bold_italic_font = "auto";
      font_size = "12.0";

      background_blur = 0; 
      adjust_line_height = 3;
      adjust_column_width = 0;

      force_ltr = "yes";
      disable_ligatures = "always";
      box_drawing_scale = "0.001, 1, 1.5, 2";
      # Cursor
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      cursor_stop_blinking_after = 15.0;
      cursor_beam_thickness = 1.5;
      cursor_underline_thickness = 2.0;
      # Scrollback
      scrollback_lines = 10000;
      scrollback_pager_history_size = 0;
      wheel_scroll_multiplier = 5.0;
      touch_scroll_multiplier = 3.0;
      #additional
      copy_on_select = "yes";
      # Mouse
      click_interval = 0.5;
      mouse_hide_wait = 1.5;
      focus_follows_mouse = "no";
      pointer_shape_when_grabbed = "arrow";
      # Window
      remember_window_size = "no";
      window_resize_step_cells = 2;
      window_resize_step_lines = 2;
      # Can set 4 values for top, right, bottom and left.
      window_border_width = 0;
      draw_minimal_borders = "yes";
      single_window_margin_width = -1;
      window_margin_width = 5;
      # Can set 4 values for top, right, bottom and left.
      window_padding_width = 0;
      inactive_text_alpha = 1.0;
      # placement_strategy center
      placement_strategy = "top-left";
      # hide_window_decorations yes
      hide_window_decorations = "no";
      confirm_os_window_close = "0";
      # Tabs
      tab_bar_edge = "bottom";
      tab_bar_margin_width = 4.0;
      tab_bar_min_tabs = 2;
      tab_switch_strategy = "previous";
      tab_bar_style = "fade";
      tab_separator = " ┇";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
      tab_title_template = "{title}";
      active_tab_title_template = "none";
      shell = "zsh";
      # enabled_layouts = "*";
      # "map ctrl+shift+right" = "next_tab";
      # "map ctrl+shift+left" = "previous_tab";
      # "map ctrl+shift+t" = "new_tab";
      # "map ctrl+shift+q" = "close_tab";
      # "map ctrl+shift+l" = "next_layou";
      # "map ctrl+shift+." = "move_tab_forward";
      # "map ctrl+shift+," = "move_tab_backward";
      # "map ctrl+shift+alt+t" = "set_tab_title";
      #
      # "map ctrl+\\ launch --location" = "hsplit";
      # "map ctrl+- launch --location" = "vsplit";
    };
  };

  home.file.".config/kitty/colors.conf" = {
    source = ./style.conf;
  };

}
