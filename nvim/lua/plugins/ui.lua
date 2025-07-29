return {
  "folke/flash.nvim",
  config = function(_, opts)
    require("flash").setup(opts)
    vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "NONE" })
    vim.api.nvim_set_hl(0, "FlashLabel", { link = "Search" })
  end,
}
