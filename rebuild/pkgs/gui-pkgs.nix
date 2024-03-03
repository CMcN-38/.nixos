# GUI

{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [ 
                alacritty
                cider
                discord
                firefox
                obsidian
                steam
                thunderbird
        ];
}
