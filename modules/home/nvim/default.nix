{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-airline-themes

      catppuccin-nvim
      colorizer

      cmp-nvim-lsp
      friendly-snippets
      cmp-buffer
      fidget-nvim
      cmp_luasnip
      luasnip
      nvim-cmp

      copilot-vim

      dashboard-nvim
      nvim-web-devicons

      harpoon

      indent-blankline-nvim

      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig

      neo-tree-nvim
      plenary-nvim
      nui-nvim

      none-ls-nvim

      tagbar

      telescope-nvim
      telescope-ui-select-nvim

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
        ]);
      }

      vim-be-good

      vim-commentary

      which-key-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugins/treesitter.lua}
      ${builtins.readFile ./plugins/airline.lua}
      ${builtins.readFile ./plugins/neotree.lua}
      ${builtins.readFile ./plugins/colours.lua}
      ${builtins.readFile ./plugins/completion.lua}
      ${builtins.readFile ./plugins/copilot.lua}
      ${builtins.readFile ./plugins/dashboard.lua}
      ${builtins.readFile ./plugins/harpoon.lua}
      ${builtins.readFile ./plugins/indent-blankline.lua}
      ${builtins.readFile ./plugins/lsp-config.lua}
      ${builtins.readFile ./plugins/none-ls.lua}
      ${builtins.readFile ./plugins/tagbar.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/vim-be-good.lua}
      ${builtins.readFile ./plugins/vim-commentary.lua}
      ${builtins.readFile ./plugins/which-key.lua}
    '';
  };
}
