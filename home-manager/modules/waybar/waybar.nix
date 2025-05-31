{...}:
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
      settings = [
        {
          name = "top_bar";
          layer = "top";
          position = "top";
          fixed-center = true;
          reload_style_on_change = true;
          height = 34;

          modules-left = ["hyprland/workspaces"];
          modules-center = ["clock#time" "custom/separator" "clock#week" "custom/separator_dot" "clock#month" "custom/separator" "clock#calendar"];

          modules-right = [
            "bluetooth"
            "network"
            "pulseaudio"
            "temperature"
            "battery"
            "custom/battery"
          ];

	        "hyprland/workspaces" = {
            format = "{icon}";
            disable-scroll = true;
            # show-special = true;
            # special-visible-only = true;
            all-outputs = true;
            format-icons = {
              "active" = " ";
              "default" = " ";
              "empty" = " ";
            };
            persistent-workspaces = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "eDP-1" = ["9"];
            };
          };  

          "pulseaudio" = {
		        tooltip = true;
		        scroll-step = 2;
		        format = "{icon}{volume}%";
		        format-icons = {
			        "default" = [" "  " "  " "];
              "headphone" = "  ";
	  	      };
            on-click = "exec pavucontrol";
	        };

          "network" = {
            format-wifi = "󰖩 {signalStrength}%";
            format-ethernet = "󰈀 ";
            tooltip-format = "{ifname} via {gwaddr}";
            tooltip-format-connected = "{ipaddr}/{cidr} 󰈀 ";
            format-disconnected = "󰖪 Disconnected ";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };

          "bluetooth" = {
            adapter = "orpheus";
	          format = "";
	          format-disabled = " ";
	          format-connected = " {num_connections}";
	          tooltip-format = "{controller_alias}\n{controller_address}";
	          tooltip-format-connected = "{controller_alias}\n{controller_address}\n{device_enumerate}";
	          tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
            on-click = "exec blueman-manager";
          };

          "temperature" = {
            critical-threshold = 80;
            format = "{icon}{temperatureC}°C";
            format-icons = [
              " "
              " "
              " "
            ];
          };

          "battery" = {
            interval = 5;
            states = {
	            "good" = 75;
              "warning" = 40;
              "critical" = 20;
            };
            format = "{icon}{capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{icon}{time}";
            format-icons = [
              " "
              " "
              " "
              " "
              " "
            ];
          };

          "clock#time" = {
            format = "{:%H:%M}";
            locale = "pl_PL.UTF-8";
            timezones = [ "Europe/Warsaw" ];
          };

          "custom/separator" = {
            format = " | ";
            tooltip = false;
          };

          "custom/separator_dot" = {
            format = " • ";
            tooltip = false;
          };

          "clock#week" = {
            format = "{:%a}";
          };

          "clock#month" = {
            format = "{:%h}";
          };

          "clock#calendar" = {
            format = "{:%d-%m-%Y}";
          };
          
          "custom/battery" = {
            exec = "~/.config/notifs/battery.sh";
            interval = 120;
          };
        }
      ];
    };
}
