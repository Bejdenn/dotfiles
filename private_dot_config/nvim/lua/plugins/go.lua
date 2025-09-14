return {
  "fredrikaverpil/neotest-golang",
  dependencies = {
    { "andythigpen/nvim-coverage", opts = {} },
  },
  keys = {
    {
      "<leader>tC",
      function()
        ---@diagnostic disable-next-line: missing-fields
        require("neotest").run.run({
          vim.uv.cwd(),
          extra_args = {
            go_test_args = {
              "-v",
              "-race",
              "-count=1",
              "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
            },
          },
        })
        require("coverage").load(true)
      end,
      desc = "Run All Test Files With Coverage (Neotest)",
    },
    {
      "<leader>tc",
      function()
        ---@diagnostic disable-next-line: missing-fields
        require("neotest").run.run({
          vim.fn.expand("%"),
          extra_args = {
            go_test_args = {
              "-v",
              "-race",
              "-count=1",
              "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
            },
          },
        })
        require("coverage").load(true)
      end,
      desc = "Run File With Coverage (Neotest)",
    },
  },
}
