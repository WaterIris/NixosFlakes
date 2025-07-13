{...}:
{
  home.file.".config/waybar/power-menu.sh" = {
    source = ./wofi-power-menu.sh;
  };

  programs.waybar = {
    enable = true;
    style = ./style.css;
      settings = [
        {
          name = "top_bar";
          position = "top";
          fixed-center = true;
          reload_style_on_change = true;
          height = 36;
          modules-left = ["clock#time" "clock#calendar"];
          
          modules-center = ["hyprland/workspaces"];

          modules-right = [
            "network"
            "bluetooth"
            "pulseaudio"
            "temperature"
            "battery"
            "custom/battery"
            "custom/power"
          ];

	        "hyprland/workspaces" = {
            format = "{icon}";
            disable-scroll = true;
            all-outputs = true;

            format-icons = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "default" = " ";
            };
            persistent-workspaces = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
            };
          };  

          "pulseaudio" = {
            "format" = "{volume}% {icon} ";
            "format-bluetooth" = "{icon} {volume}% -  {format_source}";
            "format-bluetooth-muted" = "{icon}  -  {format_source}";
            "format-muted" = " {format_source}";
            "format-source" = " {volume}%";
            "format-source-muted"= "";
            "format-icons"= {
              "headphone" = "";
              "default" = [""  ""  ""];
            };
            "on-click" = "pavucontrol";
          };

          "network" = {
            "interval"= 2;
            "format-wifi" = "↓ {bandwidthDownBits} - ↑ {bandwidthUpBits}";
            "format-ethernet" = "↓ {bandwidthDownBits} - ↑ {bandwidthUpBits}";
            "format-disconnected" = " Disconnected";
            "tooltip-format" = "{ifname} via {gwaddr}";
            "format-alt" = "{ifname}: {ipaddr}/{cidr}";
          };

          "bluetooth" = {
            adapter = "orpheus";
	          format = " on";
	          format-disabled = " off";
	          format-connected = " {num_connections}";
	          tooltip-format = "{controller_alias}\n{controller_address}";
	          tooltip-format-connected = "{controller_alias}\n{controller_address}\n{device_enumerate}";
	          tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
            on-click = "exec blueman-manager";
          };

          "temperature" = {
            critical-threshold = 80;
            format = "{temperatureC}°C {icon}";
            format-icons = [
              ""
              ""
              ""
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
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time}{icon}";
            format-icons = [
              " "
              " "
              " "
              " "
              " "
            ];
          };

          "clock#time" = {
            format = " {:%H:%M}";
            locale = "pl_PL.UTF-8";
            timezones = [ "Europe/Warsaw" ];
          };

          "clock#calendar" = {
            format = "󰸗 {:%d-%m-%Y}";
          };
          
          "custom/battery" = {
            exec = "~/.config/notifs/battery.sh";
            interval = 120;
          };

          "custom/power"= {
            "format"= "";
            "tooltip"= false;
            "on-click"= "~/.config/waybar/power-menu.sh";
            "on-click-right"= "hyprctl dispatch exit";
            "interval"= 60;
          };
        }
      ];
    };
}
