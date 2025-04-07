return {
  "yorik1984/newpaper.nvim",
  priority = 1000,
  lazy = false, -- load immediately
  name = "papercolor",
  config = function()
    vim.cmd("colorscheme PaperColor")
  end,
}
