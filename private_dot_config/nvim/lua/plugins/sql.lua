return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        sqlfluff = {
          args = {
            'lint',
            '--format=json',
          }
        }
      }
    }
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        sqlfluff = {
          args = { "format", "-" },
        }
      }
    }
  }
}
