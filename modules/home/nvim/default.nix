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
      mini-nvim

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

      indent-blankline-nvim

      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig

      neo-tree-nvim
      plenary-nvim
      nui-nvim

      none-ls-nvim

      telescope-nvim
      telescope-ui-select-nvim

      todo-comments-nvim

      nvim-treesitter.withAllGrammars

      comment-nvim

      which-key-nvim

      harpoon
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugins/harpoon.lua}
      ${builtins.readFile ./plugins/treesitter.lua}
      ${builtins.readFile ./plugins/neotree.lua}
      ${builtins.readFile ./plugins/comment.lua}
      ${builtins.readFile ./plugins/colours.lua}
      ${builtins.readFile ./plugins/completion.lua}
      ${builtins.readFile ./plugins/copilot.lua}
      ${builtins.readFile ./plugins/dashboard.lua}
      ${builtins.readFile ./plugins/indent-blankline.lua}
      ${builtins.readFile ./plugins/lsp-config.lua}
      ${builtins.readFile ./plugins/mini.lua}
      ${builtins.readFile ./plugins/none-ls.lua}
      ${builtins.readFile ./plugins/telescope.lua}
    '';
  };
}
