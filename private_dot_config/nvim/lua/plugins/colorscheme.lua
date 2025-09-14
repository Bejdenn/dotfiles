return {
  -- FIX: Remove this plugin spec when this
  -- PR (https://github.com/LazyVim/LazyVim/pull/6354) has been merged
  {
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
