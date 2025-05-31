{...}:
{
  programs.waybar = {
    enable = true;
    style = ./iri.css;
      settings = [
        {
          layer = "top";
          position = "top";
          fixed-center= true;
          reload_style_on_change = true;

          modules-left = [ 
            "clock"
            "cpu"
            "memory"
            "disk"
          ];

          modules-center = [
            "hyprland/workspaces"
          ];

          modules-right = [
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
              "1" = " ";
              "2" = " ";
              "3" = " ";
              "4" = " ";
              "5" = " ";
              "6" = " ";
              "9" = " ";
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

          "clock" = {
            format = ''  {:L%H:%M}'';
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
          };

          "memory" = {
            interval = 5;
            format = "  {}%";
            tooltip = true;
          };

          "cpu" = {
            interval = 5;
            format = "  {usage:2}%";
            tooltip = true;
          };

          "disk" = {
            format = "󰋊 {free}";
            tooltip = true;
          };

          "pulseaudio" = {
		        tooltip = true;
		        scroll-step = 2;
		        format = "{icon}  {volume}%";
		        format-icons = {
			        "default" = [""  ""  ""];
              "headphone" = "";
	  	      };
	        };

          "network" = {
            format-wifi = "󰖩 {signalStrength}%";
            format-ethernet = "{ipaddr}/{cidr} 󰈀 ";
            # format-ethernet = " 󰈀 ";
            tooltip-format = "{ifname} via {gwaddr}";
            format-disconnected = "󰖪 Disconnected ";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };

          "temperature" = {
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = ["" "" ""];
          };

          "battery" = {
            interval = 5;
            states = {
	            "good" = 75;
              "warning" = 40;
              "critical" = 20;
            };
            format =  "{icon} {capacity}%";
            format-charging =  "󰂄 {capacity}%";
            format-plugged =  " {capacity}%";
            format-alt = "{icon} {time}";
            format-icons = [
              "󰁻"
              "󰁼"
              "󰁾"
              "󰂀"
              "󰂂"
              "󰁹"
            ];
          };

          "custom/battery" = {
            "exec" = "~/.config/notifs/battery.sh";
            "interval" = 120;
          };
        }
      ];
    };
}
