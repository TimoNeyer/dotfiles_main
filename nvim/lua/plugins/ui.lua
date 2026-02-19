return {
  {
    "folke/flash.nvim",
    config = function(_, opts)
      require("flash").setup(opts)
      vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "NONE" })
      vim.api.nvim_set_hl(0, "FlashLabel", { link = "Search" })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      markdown = {
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
        bullets = { "#", "##", "###", "####" },
      },
    },
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "junegunn/fzf.vim", dependencies = "junegunn/fzf", lazy = false },
  { "sainnhe/everforest", lazy = false },
}
