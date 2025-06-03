{pkgs, ...}:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 12;
  };

  gtk = {
    enable = true;
    
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = { 
      variables = ["--all"];
    };  

    settings = {
      input = {
        kb_layout = "pl";
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
        };
      };

      "$terminal" = "kitty";
      "$browser" = "firefox";
      "$run" = "rofi -show drun";
      "$off" = "rofi -show power-menu -no-show-icons";
      "$mod" = "SUPER";
      "$screen_shot" = "hyprshot -m region --clipboard-only";

      workspace = [
        "1, monitor:HDMI-A-1, default:true"
        "2, monitor:HDMI-A-1, default:true"
        "3, monitor:HDMI-A-1, default:true"
        "4, monitor:HDMI-A-1, default:true"
        "5, monitor:HDMI-A-1, default:true"
        "6, monitor:HDMI-A-1, default:true"
        "9, monitor:eDP-1, default:true"
      ];

      windowrulev2 = [ 
        # "opacity 0.90, focus:1"
        # "opacity 0.70, focus:0"

        # "opacity 1.00,focus:1,class:firefox"
        # "opacity 0.80,focus:0,class:firefox"
          
        "opacity 0.90,focus:1,class:kitty"
        "opacity 0.90,focus:0,class:kitty"
      ];

      exec-once = [ 
        "waybar"
        "dunst"
        "[workspace 1 silent] kitty"
        "[workspace 2 silent] firefox"
        "[workspace 3 silent] obsidian"
      ];

      misc = {
    	  force_default_wallpaper = 0;
    	  disable_hyprland_logo = true;
        middle_click_paste = false;
      };
      
      gestures = {
        workspace_swipe = false;
        workspace_swipe_invert = false;
        workspace_swipe_forever	= false;
      };

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, B, exec, $browser"
        "$mod, S, exec, $screen_shot"
        "$mod, D, exec, $run"
        "$mod, C, exec, hyprpicker -a"
        "$mod+Shift, C, killactive"
        "$mod+Shift, P, exec, $off"
        "$mod+Shift, M, exit"
        
        "$mod, Left, movefocus, l"
        "$mod, Right, movefocus, r"
        "$mod, Up, movefocus, u"
        "$mod, Down, movefocus, d"
        
        "Alt, Tab, cyclenext,"
        "$mod, U, layoutmsg, swapsplit"
        "$mod, I, layoutmsg, togglesplit"
        "$mod, O, togglefloating,"

	      "$mod, 1, workspace, 1"
	      "$mod, 2, workspace, 2"
	      "$mod, 3, workspace, 3"
	      "$mod, 4, workspace, 4"
	      "$mod, 5, workspace, 5"
	      "$mod, 6, workspace, 6"
	      "$mod, 9, workspace, 9"

	      "$mod+Shift, 1, movetoworkspace, 1"
	      "$mod+Shift, 2, movetoworkspace, 2"
	      "$mod+Shift, 3, movetoworkspace, 3"
	      "$mod+Shift, 4, movetoworkspace, 4"
	      "$mod+Shift, 5, movetoworkspace, 5"
	      "$mod+Shift, 6, movetoworkspace, 6"
	      "$mod+Shift, 9, movetoworkspace, 9"
      ];
      
      binde = [
        "Alt, Left, resizeactive, -10 0"
        "Alt, Right, resizeactive, 10 0"
        "Alt, Up, resizeactive, 0 -10"
        "Alt, Down, resizeactive, 0 10"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      general = {
        gaps_in = "8px";
        gaps_out = "16px";
        border_size = 2;
        "col.active_border" = "rgb(1a2137)";
        "col.inactive_border" = "rgb(1a2137)";
        layout = "dwindle";
        
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      device = {
        name = "logitech-g-pro--1"; 
        sensitivity = -0.5;
        natural_scroll = true;

      };
      
      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
        };
        shadow =  {
          enabled = false;
          # range = 15;
          # render_power = 3;
          # color = "rgb(56b8f7)";
          # color_inactive = "rgb(101319)";
        };
      };

      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
      ];

      animation = [
        "border, 1, 3, default"
        "windows, 1, 2, myBezier"
        "windowsOut, 1, 2, default, popin 80%"
        "fade, 1, 2, default"
        "workspaces, 1, 1, default"
      ];

      monitor = [
        "eDP-1, 1920x1080@144, 0x0, 1"
        # "HDMI-A-1, 2560x1440x@144, 0x0,1"
        # "eDP-1, 1920x1080@144, 2560x0, 1"
        "HDMI-A-1, 2560x1440x@144, 1920x0,1"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XCURSOR_SIZE,12"
      ];

    };
  };
}
