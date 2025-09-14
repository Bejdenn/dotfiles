local pdf_readers = {
  ["Darwin"] = "skim",
  ["Linux"] = "zathura",
}

vim.g.vimtex_view_method = pdf_readers[vim.uv.os_uname().sysname]
