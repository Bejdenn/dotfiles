return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex_plus = {
          settings = {
            ltex = {
              language = 'de',
            },
          }
        }
      }
    }
  },
  {
    'mason-org/mason.nvim',
    -- BUG: Normally it isnt necessary to include a LSP in `ensure_installed`;
    -- instead, putting a config in nvim-lspconfig is enough. The problem here
    -- is that LazyVim is only compatible with mason* ^1.0.0 and that does not have
    -- `ltex_plus` in its server mapping, so automatic installation is skipped.
    opts = {
      ensure_installed = {
        "ltex-ls-plus"
      }
    }
  },
  {
    "barreiroleo/ltex_extra.nvim",
    branch = "dev",
    ft = { "markdown", "tex" },
    opts = {
      load_langs = { "de" },
      path = ".ltex",
    },
  }
}
