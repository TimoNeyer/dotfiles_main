local function testbuff(buf)
  ---@diagnostic disable-next-line: undefined-field
  if (buf.bufnr or buf.tabnr) > 0 then
    ---@diagnostic disable-next-line: undefined-field
    return (buf.bufnr or buf.tabnr)
  else
    ---@diagnostic disable-next-line: undefined-field
    return (buf.bufnr or buf.tabnr) - 4
  end
end

return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "moll/vim-bbye",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        themable = false, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        buffer_close_icon = "✗",
        close_icon = "✗",
        path_components = 1, -- Show only the file name without the directory
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        name_formatter = function(buf)
          ---@diagnostic disable-next-line: undefined-field
          if buf.name == "index.html" or buf.name == "script.js" or buf.name == "styles.css" then
            ---@diagnostic disable-next-line: undefined-field
            return string.format("%d:%s/%s", testbuff(buf), buf.path, buf.name)
          else
            ---@diagnostic disable-next-line: undefined-field
            return string.format("%d:%s", testbuff(buf), buf.name)
          end
        end,
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = true,
        diagnostics_update_in_insert = false,
        color_icons = false,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = { "|", "|" }, -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        show_tab_indicators = true,
        indicator = {
          style = "none",
        },
        icon_pinned = "󰐃",
        minimum_padding = 2,
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = "insert_at_end",
        hover = {
          enabled = true,
          delay = 100,
          reveal = { "close" },
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "NeoTree",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          },
        },
      },

      highlights = {
        separator = {
          bg = require("onedarkpro.helpers").get_colors().bg,
        },
        buffer_selected = {
          bold = true,
          italic = false,
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
          sp = require("onedarkpro.helpers").get_colors().bg,
        },
        buffer = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
        },
        buffer_visible = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
        },
        background = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
          sp = require("onedarkpro.helpers").get_colors().bg,
        },
        fill = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().bg,
          sp = require("onedarkpro.helpers").get_colors().bg,
        },
        tab = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().bg,
          sp = require("onedarkpro.helpers").get_colors().bg,
        },
        close_button = {
          bg = require("onedarkpro.helpers").get_colors().bg,
        },
        numbers = {
          bg = require("onedarkpro.helpers").get_colors().bg,
        },
        tab_separator = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().bg,
        },
        offset_separator = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
          sp = require("onedarkpro.helpers").get_colors().bg,
        },
        diagnostic = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
        },
        modified = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
        },
        error = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
        },
        info = {
          bg = require("onedarkpro.helpers").get_colors().bg,
          fg = require("onedarkpro.helpers").get_colors().fg,
        },
      },
    })
  end,
}
