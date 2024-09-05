local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context"
  },
  {
    "fpeterek/nvim-surfers",
    config = function()
      require('nvim-surfers').setup({
        use_tmux = true,
      })
    end,
    lazy = false,
  }
}
return plugins
