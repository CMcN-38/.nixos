# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;
  programs.waybar.settings = {
{
    "layer": "top",
    "position": "top",
    "height": 36,
    "spacing": 4,
    "exclusive": true,
    "passthrough": false,
    "fixed-center": true,

    "modules-left": ["hyprland/workspaces", "custom/sep", "hyprland/window"],
    "modules-center": ["custom/music-player"],
    "modules-right": [
        "custom/screen-recorder",
        "custom/sep",
        "pulseaudio",
        "pulseaudio#microphone",
        "clock",
        "clock#date",
        "custom/sep",
        "tray",
    ],

    "custom/screen-recorder": {
        "exec": "~/.config/waybar/modules/screen_recorder_init.sh",
        "interval": 1,
        "return-type": "json",
        "format": "{}",
        "on-click": "~/.config/waybar/modules/screen_recorder.sh save",
        "on-click-middle": "~/.config/waybar/modules/screen_recorder.sh restart",
        "on-click-right": "~/.config/waybar/modules/screen_recorder.sh stop",
    },

    "custom/music-player": {
        "interval": 1,
        "format": "{}",
        "return-type": "json",
        "exec": "~/.config/waybar/modules/music_player.sh grep",
        "on-click": "~/.config/waybar/modules/music_player.sh previous",
        "on-click-middle": "~/.config/waybar/modules/music_player.sh pause",
        "on-click-right": "~/.config/waybar/modules/music_player.sh next",
    },

    "wlr/workspaces": {
        "on-click": "activate",
        "format": "{name}",
        "all-outputs": true,
        "disable-scroll": false,
        "active-only": false,
    },

    "hyprland/window": {
        "format": "{}",
        "rewrite": {
            "(.{42}).*": "$1..",
        },
        "icon": true,
        "icon-size": 22,
    },

    "tray": {
        "show-passive-items": true,
        "spacing": 10,
    },

    "clock": {
        "tooltip": false,
        "format": "  {:%H:%M}",
    },

    "clock#date": {
        "format": "  {:L%a %d %b}",
        "tooltip-format": "<tt>{calendar}</tt>",
        "calendar": {
            "mode": "month",
            "mode-mon-col": 3,
            "on-click-right": "mode",
            "format": {
                "months": "<span color='#f5e0dc'><b>{}</b></span>",
                "weekdays": "<span color='#f9e2af'><b>{}</b></span>",
                "today": "<span color='#f38ba8'><b>{}</b></span>",
            },
        },
        "actions": { "on-click-right": "mode" },
        "min-length": 8,
        "max-length": 28,
    },

    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": "  muted",
        "format-icons": {
            "headphone": " ",
            "hands-free": "󰂑",
            "headset": "󰂑",
            "phone": "",
            "portable": "",
            "car": "",
            "default": [" ", " ", " "],
        },
        "on-click-middle": "pamixer -t",
        "on-click": "pavucontrol",
    },

    "pulseaudio#microphone": {
        "format": "{format_source}",
        "format-source": " {volume}%",
        "format-source-muted": "",
        "on-click": "pavucontrol -t 4",
        "on-click-middle": "~/.config/hypr/scripts/volume.sh --toggle-mic",
        "on-scroll-up": "~/.config/hypr/scripts/volume.sh --mic-inc",
        "on-scroll-down": "~/.config/hypr/scripts/volume.sh --mic-dec",
        "tooltip-format": "{source_desc} | {source_volume}%",
    },

    "custom/sep": {
        "format": "|",
        "tooltip": false,
    },

    "custom/power": {
        "tooltip": false,
        "on-click": "~/.config/rofi/powermenu/type-2/powermenu.sh &",
        "format": "⏻ ",
    },
}
  };

  programs.waybar.style = ''
* {
    min-height: 0;
    /* font-family: Lexend, "Font Awesome 6 Free Solid"; */
    font-family: JetBrainsMono Nerd Font;
    font-size: 14px;
    font-weight: 500;
}

window#waybar {
    transition-property: background-color;
    transition-duration: 0.5s;
    /* background-color: #1e1e2e; */
    /* background-color: #181825; */
    background-color: rgba(24, 24, 37, 0.8);
}

window#waybar.hidden {
    opacity: 0.5;
}

#workspaces {
    background-color: transparent;
}

#workspaces button {
    all: initial;
    min-width: 0;
    box-shadow: inset 0 -3px transparent;
    padding: 2px 10px;
    min-height: 0;
    margin: 4px 4px;
    border-radius: 8px;
    background-color: #181825;
    color: #cdd6f4;
}

#workspaces button:hover {
    box-shadow: inherit;
    text-shadow: inherit;
    color: #1e1e2e;
    background-color: #cdd6f4;
}

#workspaces button.active {
    color: #1e1e2e;
    background-color: #89b4fa;
}

#workspaces button.urgent {
    background-color: #f38ba8;
}

#clock,
#pulseaudio,
#custom-logo,
#custom-power,
#custom-music-player,
#cpu,
#tray,
#memory,
#window,
#custom-screen-recorder,
#custom-gpu {
    min-height: 0;
    padding: 2px 10px;
    border-radius: 8px;
    margin: 4px 4px;
    background-color: #181825;
}

#custom-sep {
    padding: 0px;
    color: #585b70;
}

#custom-screen-recorder.recording {
    color: #10ef2c;
}

#custom-screen-recorder.not-recording {
    color: #df2020;
}

#custom-music-player.playing {
    color: #cdd6f4;
}

#custom-music-player.paused {
    color: #9399b2;
}

window#waybar.empty #window {
    background-color: transparent;
}

#cpu {
    color: #94e2d5;
    margin-left: 0;
    margin-right: 0;
}

#custom-gpu {
    color: #94e2d5;
    margin-left: 0;
    margin-right: 0;
}

#memory {
    margin-left: 0;
    color: #cba6f7;
}

#clock {
    color: #74c7ec;
}

#clock.simpleclock {
    color: #89b4fa;
}

#window {
    color: #a6e3a1;
}

#pulseaudio {
    color: #b4befe;
}

#pulseaudio.muted {
    color: #a6adc8;
}

#custom-logo {
    color: #89b4fa;
}

#custom-power {
    color: #f38ba8;
    padding-right: 5px;
    font-size: 14px;
}

@keyframes blink {
    to {
        background-color: #f38ba8;
        color: #181825;
    }
}

tooltip {
    border-radius: 8px;
}

#tray menu {
    background: rgb(24, 24, 37);
    color: white;
}
  '';
}
