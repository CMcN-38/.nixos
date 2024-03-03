# Serv

{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [ 
                bluez
                blueman
                libnotify
                logiops
                networkmanagerapplet
                (python3.withPackages (python-pkgs: [
                        python-pkgs.requests
                ]))
                wireguard-tools
        ];
}
