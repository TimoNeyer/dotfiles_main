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
      --vim.cmd.colorscheme("nord")
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
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    setup = function()
      require("catppuccin").setup()
      vim.cmd.colorscheme("catppuccin-frappe")
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {
      terminals = {
        { name = "Scratch" },
        { name = "1" },
      },
    },
    cmd = "FloatermToggle",
  },
}
