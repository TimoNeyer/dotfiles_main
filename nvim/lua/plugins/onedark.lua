return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onedarkpro").setup()
  end,
}
