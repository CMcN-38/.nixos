{ config, pkgs, ...}:

{
  programs.neovim = {
    enable = true

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [




     ];


    extraLuaConfig = ''
        -- Lua Code Here

        ${builtins.readFile ./options.lua}
        ${builtins.readFile ./plugin/vim-airline.lua}
    };
}
