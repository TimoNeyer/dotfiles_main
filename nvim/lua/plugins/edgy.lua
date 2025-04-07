return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    close_when_last = true,
    animate = {
      enabled = false,
    },
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "toggleterm",
        title = "Terminal",
        open = "terminal zsh",
        size = { height = 0.3 },
        filter = function(buf)
          return not vim.bo[buf].buftype == "terminal"
        end,
        pinned = true,
      },
      { ft = "qf", title = "QuickFix" },
      "Trouble",
    },
    left = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.5 },
        pinned = true,
        open = "Neotree show top",
      },
      {
        title = "Neo-Tree Git",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        size = { height = 0.25 },
        pinned = true,
        open = "Neotree  git_status show bottom",
      },
      {
        title = "Neo-Tree Buffers",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        size = { height = 0.25 },
        pinned = true,
        open = "Neotree buffers show bottom",
      },
      "neo-tree",
    },
    right = {
      { title = "Grug Far", ft = "grug-far", size = { width = 0.4 } },
    },
  },
}
