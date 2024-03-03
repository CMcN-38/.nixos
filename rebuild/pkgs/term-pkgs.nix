# Term

{ pkgs, ... } : {
        environment.systemPackages = with pkgs; [ 
                alejandra
                btop 
                docker
                fzf
                gh
                git
                lazygit
                mpv
                neovim
                starship
                vim
                zoxide
        ];
}
