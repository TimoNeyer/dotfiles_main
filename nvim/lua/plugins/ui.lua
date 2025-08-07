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
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    setup = function()
      require("nord").setup({
        on_colors = function(colors)
          colors.polar_night.brighter = "#000000"
        end,
      })
      vim.cmd.colorscheme("nord")
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
  {
    "3rd/image.nvim",
    opts = {},
  },
}
