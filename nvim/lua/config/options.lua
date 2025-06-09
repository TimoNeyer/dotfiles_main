-----------------------------
-- Vim core configuration
-----------------------------

-- vim.lsp.set_log_level("debug")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.schedule(function()
--  vim.opt.clipboard = "unnamedplus"
--end)
vim.opt.clipboard = ""
-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { t = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Show ruler
vim.opt.colorcolumn = "80"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Line wrapping
vim.opt.wrap = false
vim.opt.linebreak = true

-- Enable terminal colors
vim.opt.termguicolors = true

-- Set tabs to spaces
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- stop excessinve insert mode deletions
vim.opt.backspace = { "indent", "eol", "start" }

-- Set spell checking
-- vim.opt.spell = true
-- vim.opt.spelllang = {"en_us","de_de"}

vim.g.vimtex_view_method = "zathura"

vim.api.nvim_create_user_command("Random", function(opts)
  local args = opts.fargs
  local copy = false
  local length = 32

  for _, arg in ipairs(args) do
    if arg == "copy=true" then
      copy = true
    elseif arg:match("^%d+$") then
      length = tonumber(arg) or 32
    end
  end

  local handle = io.popen("head -c " .. length * 4 .. " /dev/urandom | tr -dc '[:alnum:]' | head -c" .. length)
  if not handle then
    print("Unable to read /dev/urandom")
    return
  end
  local output = handle:read("*a"):gsub("%s+", ""):sub(1, length)
  handle:close()

  if copy then
    vim.fn.setreg("+", output)
    print("Copied to clipboard: " .. output)
  else
    vim.api.nvim_put({ output }, "c", true, true)
  end
end, {
  nargs = "*",
  complete = function(_, line)
    -- Optional completion suggestions
    return { "copy=true", "copy=false", "16", "32", "64" }
  end,
})
