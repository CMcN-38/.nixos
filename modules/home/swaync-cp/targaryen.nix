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
        @define-color bg-base "#010101";
        # @define-color cc-grey "#151f1e";
        @define-color cc-grey "#eeeeee";
        @define-color cc-white "#eeeeee";
        @define-color cc-blue "#96CBFE";
        @define-color cc-dark-blue "#ff73fd";
        @define-color cc-red "#ff6c60";
        @define-color cc-green "#a8ff60";
    * {
        font-family: Fira Code Nerd Font;
        font-weight: bolder;
    }

    .control-center .notification-row:focus,
    .control-center .notification-row:hover {
        opacity: 0.9;
        background: @bg-base
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
        background: @bg-base;
        padding: 10px;
        border-radius: 5px;
        border: 2px solid @cc-blue;
        margin: 0;
    }

    .notification-default-action {
        margin: 0;
        padding: 0;
        border-radius: 5px;
    }

    .close-button {
        background: @cc-red;
        color: @cc-grey;
        text-shadow: none;
        padding: 0;
        border-radius: 5px;
        margin-top: 5px;
        margin-right: 5px;
    }

    .close-button:hover {
        box-shadow: none;
        background: @cc-red;
        transition: all .15s ease-in-out;
        border: none
    }


    .notification-action {
        border: 2px solid @cc-blue;
        border-top: none;
        border-radius: 5px;
    }


    .notification-default-action:hover,
    .notification-action:hover {
        color: @cc-blue;
        background: @cc-blue
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
        background: @bg-base
    }

    .notification-action:last-child {
        border-bottom-right-radius: 10px;
        background: @bg-base
    }

    .inline-reply {
        margin-top: 8px
    }

    .inline-reply-entry {
        background: @bg-base;
        color: @cc-white;
        caret-color: @cc-white;
        border: 1px solid @cc-green;
        border-radius: 5px
    }

    .inline-reply-button {
        margin-left: 4px;
        background: @bg-base;
        border: 1px solid @cc-green;
        border-radius: 5px;
        color: @cc-white
    }

    .inline-reply-button:disabled {
        background: initial;
        color: @cc-dark-blue;
        border: 1px solid transparent
    }

    .inline-reply-button:hover {
        background: @bg-base
    }

    .body-image {
        margin-top: 6px;
        background-color: @cc-white;
        border-radius: 5px
    }

    .summary {
        font-size: 16px;
        font-weight: 700;
        background: transparent;
        color: @cc-green;
        text-shadow: none
    }

    .time {
        font-size: 16px;
        font-weight: 700;
        background: transparent;
        color: @cc-white;
        text-shadow: none;
        margin-right: 18px
    }

    .body {
        font-size: 15px;
        font-weight: 400;
        background: transparent;
        color: @cc-white;
        text-shadow: none
    }

    .control-center {
        background: @bg-base;
        border: 2px solid @cc-dark-blue;
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
        color: @cc-blue;
        background: @bg-base;
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        font-size: 1.5rem;
        border-radius: 5px;
    }

    .widget-title>button {
        font-size: 1rem;
        color: @cc-white;
        text-shadow: none;
        background: @bg-base;
        box-shadow: none;
        border-radius: 5px;
    }

    .widget-title>button:hover {
        background: @cc-red;
        color: @bg-base;
    }

    .widget-dnd {
        background: @bg-base;
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
        font-size: large;
        color: @cc-blue;
    }

    .widget-dnd>switch {
        border-radius: 5px;
        /* border: 1px solid @cc-blue; */
        background: @cc-blue;
    }

    .widget-dnd>switch:checked {
        background: @cc-red;
        border: 1px solid @cc-red;
    }

    .widget-dnd>switch slider {
        background: @bg-base;
        border-radius: 5px
    }

    .widget-dnd>switch:checked slider {
        background: @bg-base;
        border-radius: 5px
    }

    .widget-label {
        margin: 10px 10px 5px 10px;
    }

    .widget-label>label {
        font-size: 1rem;
        color: @cc-white;
    }

    .widget-mpris {
        color: @cc-white;
        background: @bg-base;
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
        background: @cc-grey;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button {
        margin: 3px;
        background: @bg-base;
        border-radius: 5px;
        color: @cc-white;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button:hover {
        background: @cc-blue;
        color: @bg-base;
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
        background: @cc-grey;
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
        font-size: x-large;
        color: @cc-white;
    }

    .widget-volume>box>button {
        background: @cc-blue;
        border: none
    }

    .per-app-volume {
        background-color: @bg-base;
        padding: 4px 8px 8px;
        margin: 0 8px 8px;
        border-radius: 5px;
    }

    .widget-backlight {
        background: @cc-grey;
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: 5px;
        font-size: x-large;
        color: @cc-white
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
