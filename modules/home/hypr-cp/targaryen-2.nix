# home.nix
{
  config,
  pkgs,
  ...
}: {
wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig =
        ''
          env = NIXOS_OZONE_WL, 1
          env = NIXPKGS_ALLOW_UNFREE, 1
          env = XDG_CURRENT_DESKTOP, Hyprland
          env = XDG_SESSION_TYPE, wayland
          env = XDG_SESSION_DESKTOP, Hyprland
          env = GDK_BACKEND, wayland, x11
          env = CLUTTER_BACKEND, wayland
          env = QT_QPA_PLATFORM=wayland;xcb
          env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
          env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
          env = SDL_VIDEODRIVER, x11
          env = MOZ_ENABLE_WAYLAND, 1
          exec-once = dbus-update-activation-environment --systemd --all
          exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
          exec-once = nm-applet --indicator
          exec-once = lxqt-policykit-agent
    exec-once = waybar
    exec-once = swaync
    exec-once = logid
    exec-once = streamdeck -n
    exec-once = swww-daemon #Wallpaper
    exec-once = random-wallpaper
    exec-once = thunar --daemon #Start file manager daemon in the background
    exec-once = goxlr-daemon --http-disable
    exec-once = solaar -w hide
          monitor=,preferred,auto,1
    # monitor=,3840x2160,auto,1

    # Set programs that you use
    $terminal = kitty
    $fileManager = thunar
    $menu = rofi -show drun
    $browser = appimage-run -d /home/cameron/2_desktop/zen-specific.AppImage
    # $browser = firefox

          general {
            gaps_in = 5
            gaps_out = 5
            border_size = 3
            layout = dwindle
            resize_on_border = true
            col.active_border = rgba(6ee9f8ff) 
            col.inactive_border = rgba(4e112aff)
            # allow_tearing = false
          }
          input {
            kb_options = grp:alt_shift_toggle
            kb_options = caps:super
            follow_mouse = 1
            touchpad {
              natural_scroll = true
              disable_while_typing = false
              scroll_factor = 0.2
            }
            sensitivity = 1 # -1.0 - 1.0, 0 means no modification.
            accel_profile = flat
          }


    #Thunar Float
    windowrule = float, ^(thunar)$
    windowrule = center, ^(thunar)$
    windowrule = size 2500 1000, ^(thunar)$

    #Pulse Audio
    windowrule = float, ^(org.pulseaudio.pavucontrol)$
    windowrule = move 83% 2.5%, ^(org.pulseaudio.pavucontrol)$
    windowrule = size 600 1000, ^(org.pulseaudio.pavucontrol)$


        #Rofi
        windowrule = float, ^(Rofi)$
        windowrule = center, ^(Rofi)$
        # windowrule = size 1000 350, ^(Rofi)$

    #Workspaces
    # windowrule = workspace 3, title:^(.\*Espanso.\*)$
    # windowrulev2 = workspace 3, title:^(Espanso Sync Tool)$

    # Transparency Rules
    windowrule = opacity 1, ^(firefox)$
    # windowrule = opacity 0.95, ^(firefox)$
    # windowrule = opacity 1, ^(Zen Browser)$
    windowrule = opacity 0.95, ^(zen-alpha)$
    windowrule = opacity 0.95, ^(discord)$
    windowrule = opacity 0.95, ^(Cider)$
    # windowrule = opacity 0.85, ^(kitty)$
    # Layer Rules
    layerrule = blur, ^(swaync)$
    layerrule = blur, ^(waybar)$


          gestures {
            workspace_swipe = true
            workspace_swipe_fingers = 3
            workspace_swipe_distance = 1200
          }
          misc {
            initial_workspace_tracking = 0
            mouse_move_enables_dpms = true
            key_press_enables_dpms = false
            # vrr = 1
            force_default_wallpaper = 0
          }
          animations {
            enabled = yes
            bezier = wind, 0.05, 0.9, 0.1, 1.05
            bezier = winIn, 0.1, 1.1, 0.1, 1.1
            bezier = winOut, 0.3, -0.3, 0, 1
            bezier = liner, 1, 1, 1, 1
            animation = windows, 1, 6, wind, popin 80%
            animation = windowsIn, 1, 6, winIn, popin 80%
            animation = windowsOut, 1, 5, winOut, popin 80%
            animation = windowsMove, 1, 5, wind, slide
            animation = border, 1, 10, default
            animation = fade, 1, 10, default
            animation = workspaces, 1, 5, default
          }
          decoration {
            rounding = 0
            blur {
                enabled = true
                size = 3
                passes = 1
                new_optimizations = on
                ignore_opacity = off
            }
            shadow {
                enabled = true
                range = 4
                render_power = 3
                color = rgba(1a1a1aee)
                }
          }
          plugin {
            hyprtrails {
            }
          }
          dwindle {
            pseudotile = true
            preserve_split = true
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
        '';
};
}
