# WM

{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [ 
                pavucontrol

                #Screenshot Tools
                grim
                slurp
                swappy

                swaynotificationcenter
                swww
                waybar
                wofi
                xfce.thunar        
        ];
}
