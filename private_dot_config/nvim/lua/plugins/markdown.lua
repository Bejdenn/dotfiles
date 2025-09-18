return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "deno",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      html = {
        comment = {
          conceal = false,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettier", "deno_fmt", "markdown-toc" },
      },
    },
  },
}
