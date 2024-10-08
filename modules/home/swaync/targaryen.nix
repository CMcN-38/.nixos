# home.nix
{
  config,
  pkgs,
  ...
}: {
  services.swaync.enable = true;
  services.swaync.settings = {
    "$schema" = "/etc/xdg/swaync/configSchema.json";
    "positionX" = "right";
    "positionY" = "top";
    "control-center-margin-top" = 10;
    "control-center-margin-bottom" = 10;
    "control-center-margin-right" = 10;
    "control-center-margin-left" = 10;
    "notification-icon-size" = 64;
    "notification-body-image-height" = 100;
    "notification-body-image-width" = 200;
    "timeout" = 10;
    "timeout-low" = 5;
    "timeout-critical" = 0;
    "fit-to-screen" = false;
    "control-center-width" = 500;
    "control-center-height" = 1025;
    "notification-window-width" = 500;
    "keyboard-shortcuts" = true;
    "image-visibility" = "when-available";
    "transition-time" = 200;
    "hide-on-clear" = false;
    "hide-on-action" = true;
    "script-fail-notify" = true;
    "widgets" = [
      "title"
      "buttons-grid"
      "mpris"
      "volume"
      "backlight"
      "dnd"
      "notifications"
    ];
    "widget-config" = {
      "title" = {
        "text" = "Notification Center";
        "clear-all-button" = true;
        "button-text" = "󰆴 Clear All";
      };
      "dnd" = {
        "text" = "Do Not Disturb";
      };
      "label" = {
        "max-lines" = 1;
        "text" = "Notification Center";
      };
      "mpris" = {
        "image-size" = 96;
        "image-radius" = 7;
      };
      "volume" = {
        "label" = "󰕾";
      };
      "backlight" = {
        "label" = "󰃟";
      };
      "buttons-grid" = {
        "actions" = [
          {
            "label" = "󰐥";
            "command" = "systemctl poweroff";
          }
          {
            "label" = "󰜉";
            "command" = "systemctl reboot";
          }
          {
            "label" = "";
            "command" = "thunar";
          }
          {
            "label" = "";
            "command" = "cider";
          }
          {
            "label" = "󰕾";
            "command" = "pamixer --toggle-mute";
          }
          {
            "label" = "󰍬";
            "command" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          }
        ];
      };
    };
  };

  services.swaync.style = ''

    * {
        font-family: Ubuntu Nerd Font;
        font-weight: bolder;
    }

    .control-center .notification-row:focus,
    .control-center .notification-row:hover {
        opacity: 0.9;
        background: #1a1b26
    }

    .notification-row {
        outline: none;
        margin: 10px;
        padding: 0;
    }

    .notification {
        background: transparent;
        padding: 0;
        margin: 0px;
    }

    .notification-content {
        background: #1a1b26;
        padding: 10px;
        border-radius: 5px;
        border: 2px solid #7aa2f7;
        margin: 0;
    }

    .notification-default-action {
        margin: 0;
        padding: 0;
        border-radius: 5px;
    }

    .close-button {
        background: #f7768e;
        color: #15161e;
        text-shadow: none;
        padding: 0;
        border-radius: 5px;
        margin-top: 5px;
        margin-right: 5px;
    }

    .close-button:hover {
        box-shadow: none;
        background: #f7768e;
        transition: all .15s ease-in-out;
        border: none
    }


    .notification-action {
        border: 2px solid #7aa2f7;
        border-top: none;
        border-radius: 5px;
    }


    .notification-default-action:hover,
    .notification-action:hover {
        color: #7aa2f7;
        background: #7aa2f7
    }

    .notification-default-action {
        border-radius: 5px;
        margin: 0px;
    }

    .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 7px;
        border-bottom-right-radius: 7px
    }

    .notification-action:first-child {
        border-bottom-left-radius: 10px;
        background: #1a1b26
    }

    .notification-action:last-child {
        border-bottom-right-radius: 10px;
        background: #1a1b26
    }

    .inline-reply {
        margin-top: 8px
    }

    .inline-reply-entry {
        background: #1a1b26;
        color: #c0caf5;
        caret-color: #c0caf5;
        border: 1px solid #9ece6a;
        border-radius: 5px
    }

    .inline-reply-button {
        margin-left: 4px;
        background: #1a1b26;
        border: 1px solid #9ece6a;
        border-radius: 5px;
        color: #c0caf5
    }

    .inline-reply-button:disabled {
        background: initial;
        color: #414868;
        border: 1px solid transparent
    }

    .inline-reply-button:hover {
        background: #1a1b26
    }

    .body-image {
        margin-top: 6px;
        background-color: #c0caf5;
        border-radius: 5px
    }

    .summary {
        font-size: 16px;
        font-weight: 700;
        background: transparent;
        color: rgba(158, 206, 106, 1);
        text-shadow: none
    }

    .time {
        font-size: 16px;
        font-weight: 700;
        background: transparent;
        color: #c0caf5;
        text-shadow: none;
        margin-right: 18px
    }

    .body {
        font-size: 15px;
        font-weight: 400;
        background: transparent;
        color: #c0caf5;
        text-shadow: none
    }

    .control-center {
        background: #1a1b26;
        border: 2px solid #34548a;
        border-radius: 5px;
    }

    .control-center-list {
        background: transparent
    }

    .control-center-list-placeholder {
        opacity: .5
    }

    .floating-notifications {
        background: transparent
    }

    .blank-window {
        background: alpha(black, 0.1)
    }

    .widget-title {
        color: #7aa2f7;
        background: #1a1b26;
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        font-size: 1.5rem;
        border-radius: 5px;
    }

    .widget-title>button {
        font-size: 1rem;
        color: #c0caf5;
        text-shadow: none;
        background: #1a1b26;
        box-shadow: none;
        border-radius: 5px;
    }

    .widget-title>button:hover {
        background: #f7768e;
        color: #1a1b26;
    }

    .widget-dnd {
        background: #1a1b26;
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
        font-size: large;
        color: #7aa2f7;
    }

    .widget-dnd>switch {
        border-radius: 5px;
        /* border: 1px solid #7aa2f7; */
        background: #7aa2f7;
    }

    .widget-dnd>switch:checked {
        background: #f7768e;
        border: 1px solid #f7768e;
    }

    .widget-dnd>switch slider {
        background: #1a1b26;
        border-radius: 5px
    }

    .widget-dnd>switch:checked slider {
        background: #1a1b26;
        border-radius: 5px
    }

    .widget-label {
        margin: 10px 10px 5px 10px;
    }

    .widget-label>label {
        font-size: 1rem;
        color: #c0caf5;
    }

    .widget-mpris {
        color: #c0caf5;
        background: #1a1b26;
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
    }

    .widget-mpris > box > button {
        border-radius: 5px;
    }

    .widget-mpris-player {
        padding: 5px 10px;
        margin: 10px
    }

    .widget-mpris-title {
        font-weight: 700;
        font-size: 1.25rem
    }

    .widget-mpris-subtitle {
        font-size: 1.1rem
    }

    .widget-buttons-grid {
        font-size: x-large;
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
        background: #15161e;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button {
        margin: 3px;
        background: #1a1b26;
        border-radius: 5px;
        color: #c0caf5;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button:hover {
        background: rgba(122, 162, 247, 1);
        color: #1a1b26;
    }

    .widget-menubar>box>.menu-button-bar>button {
        border: none;
        background: transparent
    }

    .topbar-buttons>button {
        border: none;
        background: transparent
    }

    .widget-volume {
        background: #15161e;
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
        font-size: x-large;
        color: #c0caf5;
    }

    .widget-volume>box>button {
        background: #7aa2f7;
        border: none
    }

    .per-app-volume {
        background-color: #1a1b26;
        padding: 4px 8px 8px;
        margin: 0 8px 8px;
        border-radius: 5px;
    }

    .widget-backlight {
        background: #15161e;
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
        font-size: x-large;
        color: #c0caf5
    }

    /* .widget-inhibitors {
        margin: 8px;
        font-size: 1.5rem
    }

    .widget-inhibitors>button {
        font-size: initial;
        color: @text-color;
        text-shadow: none;
        background: @noti-bg;
        border: 1px solid red;
        box-shadow: none;
        border-radius: 7px
    }

    .widget-inhibitors>button:hover {
        background: @noti-bg-hover
    } */


  '';
}
