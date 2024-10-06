# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      "position" = "top";

      "modules-left" = [
        "hyprland/workspaces"
      ];
      "modules-center" = [];
      "modules-right" = [
        "custom/packages"
        "cpu"
        "memory"
        "network#wifi"
        "battery"
        "pulseaudio"
        "clock"
        "custom/notification"
      ];
      "hyprland/workspaces" = {
        "format" = "{icon}";
        "format-icons" = {
          "default" = " ";
          "active" = " ";
          "urgent" = " ";
          # /* "default"= ""; */
          # /* "active"= ""; */
          # /* "urgent"= "" */
        };
        "on-scroll-up" = "hyprctl dispatch workspace e+1";
        "on-scroll-down" = "hyprctl dispatch workspace e-1";
      };
      "clock" = {
        "format" = " {:%H:%M}";
        "tooltip" = false;
      };
      "hyprland/window" = {
        "max-length" = 60;
        "separate-outputs" = false;
      };
      "memory" = {
        "interval" = 5;
        "format" = "  {}%";
      };
      "cpu" = {
        "interval" = 5;
        "format" = " {usage:2}%";
        "tooltip" = false;
      };
      "custom/packages" = {
        "exec" = "~/.local/bin/packagecount";
        "format" = " {}";
        "interval" = 45;
      };
      "network#wifi" = {
        "interval" = 1;
        "interface" = "wlp2s0";
        # //"interface"= "wlp2s0";
        "format-icons" = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
        "format-wifi" = "{icon}";
        "format-disconnected" = "󰤮 ";
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 24;
        "spacing" = 12;
      };
      "pulseaudio" = {
        "format" = "{icon} {volume}% {format_source}";
        "format-bluetooth" = "{volume}% {icon} {format_source}";
        "format-bluetooth-muted" = "{icon} {format_source}";
        "format-muted" = "{format_source}";
        "format-source" = " {volume}%";
        "format-source-muted" = " ";
        "format-icons" = {
          "headphone" = " ";
          "hands-free" = " ";
          "headset" = " ";
          "phone" = " ";
          "portable" = " ";
          "car" = " ";
          "default" = [" " " " " "];
        };
        "on-click" = "pavucontrol";
      };
      "custom/notification" = {
        "tooltip" = false;
        "format" = "{icon} {}";
        "format-icons" = {
          "notification" = " <span foreground='red'><sup></sup></span>";
          "none" = " ";
          "dnd-notification" = " <span foreground='red'><sup></sup></span>";
          "dnd-none" = " ";
          "inhibited-notification" = " <span foreground='red'><sup></sup></span>";
          "inhibited-none" = " ";
          "dnd-inhibited-notification" = " <span foreground='red'><sup></sup></span>";
          "dnd-inhibited-none" = " ";
        };
        "return-type" = "json";
        "exec-if" = "which swaync-client";
        "exec" = "swaync-client -swb";
        "on-click" = "swaync-client -t -sw";
        "escape" = true;
      };
      "battery" = {
        "states" = {
          "warning" = 30;
          "critical" = 15;
        };
        "format" = "{icon} {capacity}%";
        "format-charging" = "󰂄 {capacity}%";
        "format-plugged" = "󱘖 {capacity}%";
        "format-icons" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        "on-click" = "";
        "tooltip" = false;
      };
    };
  };
  programs.waybar.style = ''
    /*
    *
    * Catppuccin Mocha palette
    * Maintainer: rubyowo
    *
    */

    @define-color base   #1e1e2e;
    @define-color mantle #181825;
    @define-color crust  #11111b;

    @define-color text     #cdd6f4;
    @define-color subtext0 #a6adc8;
    @define-color subtext1 #bac2de;

    @define-color surface0 #313244;
    @define-color surface1 #45475a;
    @define-color surface2 #585b70;

    @define-color overlay0 #6c7086;
    @define-color overlay1 #7f849c;
    @define-color overlay2 #9399b2;

    @define-color blue      #89b4fa;
    @define-color lavender  #b4befe;
    @define-color sapphire  #74c7ec;
    @define-color sky       #89dceb;
    @define-color teal      #94e2d5;
    @define-color green     #a6e3a1;
    @define-color yellow    #f9e2af;
    @define-color peach     #fab387;
    @define-color maroon    #eba0ac;
    @define-color red       #f38ba8;
    @define-color mauve     #cba6f7;
    @define-color pink      #f5c2e7;
    @define-color flamingo  #f2cdcd;

    /* -----------------------------------------------------
     * General
     * ----------------------------------------------------- */

    * {
            font-size: 16px;
            font-family: Fira Code, Font Awesome, sans-serif;
            font-weight: bold;
    }

    window#waybar {
            background-color: rgba(26,27,38,0);
            border-bottom: 1px solid rgba(26,27,38,0);
            border-radius: 0px;
            color: #f8f8f2;
    }

    /* -----------------------------------------------------
    * Workspaces
    * ----------------------------------------------------- */
    #workspaces {
            background: pink;
            margin: 5px 3px 5px 12px;
            padding: 0px 1px;
            border-radius: 15px;
            border: 0px;
            font-style: normal;
            color: #15161e;
    }

    #workspaces button {
            padding: 0px 5px;
            margin: 4px 3px;
            border-radius: 15px;
            border: 0px;
            color: #15161e;
            background-color: lavender;
            opacity: 0.5;
            transition: all 0.3s ease-in-out;
    }

    #workspaces button.active {
            color: #15161e;
            background: lavender;
            border-radius: 15px;
            min-width: 40px;
            transition: all 0.3s ease-in-out;
            opacity: 1.0;
    }

    #workspaces button:hover {
            color: #15161e;
            background: lavender;
            border-radius: 15px;
            opacity: 1.0;
    }


    /* -----------------------------------------------------
    * Tooltips
    * ----------------------------------------------------- */
    tooltip {
            background: #1a1b26;
            border: 1px solid lavender;
            border-radius: 10px;
    }

    tooltip label {
            color: #c0caf5;
    }

    /* -----------------------------------------------------
    * Window
    * ----------------------------------------------------- */
    #window {
            color: #15161e;
            background: #c0caf5;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #custom-packages {
            color: #15161e;
            background: red;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #memory {
            color: #15161e;
            background: #fab387;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #clock {
            color: #15161e;
            background: #cbA6f7;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #cpu {
            color: #15161e;
            background: #89dceb;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #disk {
            color: #15161e;
            background: #a6e3a1;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #battery {
            color: #15161e;
            background: #eba0ac;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #network {
            color: #15161e;
            background: #f9e2af;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #tray {
            color: #15161e;
            background: #74c7ec;
            border-radius: 15px;
            margin: 5px; padding: 2px 10px;
    }

    #pulseaudio {
            color: #15161e;
            background: #94e2d5;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }

    #custom-notification {
            color: #15161e;
            background: #f5e0dc;
            border-radius: 15px;
            margin: 5px;
            padding: 2px 10px;
    }


  '';
}
