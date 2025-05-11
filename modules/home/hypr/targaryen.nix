# home.nix
{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.extraConfig = ''
    # Monitor Sttings
    # monitor=,2736x1824,auto,1.266667
    monitor=,3840x2160,auto,1

    # Set programs that you use
    $terminal = kitty
    $fileManager = thunar
    $menu = rofi -show drun
    $browser = appimage-run -d /home/cameron/2_desktop/zen-specific.AppImage
    # $browser = firefox

    # Some default env vars.
    env = XCURSOR_SIZE,24
    env = QT_QPA_PLATFORMTHEME,qt5ct
    env = XDG_CURRENT_DESKTOP,Hyprland
    env = XDG_SESSION_TYPE,wayland
    env = WLR_NO_HARDWARE_CURSORS,1
      input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =


        follow_mouse = 1

        touchpad {
            natural_scroll = yes
            disable_while_typing = false
            scroll_factor = 0.2
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        accel_profile = flat
        left_handed = false
    }

    # Cofigure touchpad gestures

    gestures {
        workspace_swipe = on
        workspace_swipe_fingers = 3
        workspace_swipe_distance = 1200
    }

    # device:MX Master 3S {
    #     sensitivity = -0.5
    # }
    #
    device {
            name = apple-inc.-magic-trackpad-2
            sensitivity = +1.0
    }

    $mainMod = SUPER

    # Basic app control bindings
    bind = $mainMod, RETURN, exec, $terminal
    bind = $mainMod, Q, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod, F, exec, $fileManager
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, SPACE, exec, $menu
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind = $mainMod, Z, exec, $browser
    bind = $mainMod, O, exec, obsidian
    bind = $mainMod, C, exec, appimage-run -d /home/cameron/2_desktop/Cider-linux-appimage-x64.AppImage
    bind = $mainMod, D, exec, discordcanary

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Example special workspace (scratchpad)
    #bind = $mainMod, S, togglespecialworkspace, magic
    #bind = $mainMod SHIFT, S, movetoworkspace, special:magic

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
    bind = $mainMod CTRL, right, workspace, e+1
    bind = $mainMod CTRL, left, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    # Wallpapers
    bind = $mainMod, W, exec, random_wallpaper
    bind = $mainMod SHIFT, W, exec, random_secret_wallpaper
    bind = $mainMod CTRL, W, exec, random_secret_wallpaper_1
    bind = $mainMod CTRL, F, exec, random_secret_wallpaper_2
    bind = $mainMod , Delete, exec, snippetexpandergui -s

    # Screenshots
    bind = $mainMod, S, exec, screenshot


    misc {
        force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
        vrr = 1
    }

    general {
        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle

        allow_tearing = false
    }

    decoration {
        rounding = 8

        blur {
            enabled = false
            size = 3
            passes = 1
        }
        shadow {
                enabled = true
                range = 4
                power = 3
                color = rgba(1a1a1aee)
                }
    }

    animations {
        enabled = yes

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }

    dwindle {
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
    }


    exec-once = waybar
    exec-once = swaync
    exec-once = logid
    exec-once = streamdeck -n
    exec-once = swww-daemon #Wallpaper
    exec-once = random-wallpaper
    exec-once = thunar --daemon #Start file manager daemon in the background
    exec-once = goxlr-daemon --http-disable
    exec-once = solaar -w hide

    #Thunar Float
    windowrule = float, class:^(thunar)$
    windowrule = center, class:^(thunar)$
    windowrule = size 2500 1000, class:^(thunar)$

    #Pulse Audio
    windowrule = float, class:^(pavucontrol)$
    windowrule = move 83% 2.5%, class:^(pavucontrol)$
    windowrule = size 600 1000, class:^(pavucontrol)$


        #Rofi
        windowrule = float, class:^(Rofi)$
        windowrule = center, class:^(Rofi)$
        windowrule = size 1000 350, class:^(Rofi)$

    #Workspaces
    # windowrule = workspace 3, title:^(.\*Espanso.\*)$
    # windowrulev2 = workspace 3, title:^(Espanso Sync Tool)$

    # Transparency Rules
    windowrule = opacity 1, class:^(firefox)$
    # windowrule = opacity 0.95, class:^(firefox)$
    windowrule = opacity 0.95, class:^(discord)$
    windowrule = opacity 0.95, class:^(Cider)$
    # windowrule = opacity 0.85, ^(kitty)$
    # Layer Rules
    layerrule = blur, ^(swaync)$
    layerrule = blur, ^(waybar)$

  '';
}
