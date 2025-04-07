return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    search = {
      multi_window = false,
      wrap = true,
    },
    modes = {
      char = {
        autohide = true,
      },
    },
  },
}
