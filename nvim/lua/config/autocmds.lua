-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local session_dir = ".vim.local"
local session_file = session_dir .. "/session.vim"

-- Terminal auto insert
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
  callback = function(args)
    if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
      vim.cmd("startinsert")
    end
  end,
})

-- Improve Terminal
vim.api.nvim_create_autocmd("TermOpen", {
  command = [[setlocal nonumber norelativenumber winhl=Normal:NormalFloat]],
})

-- static session management, remember to ignore .vim.local/ in git!
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Get the first argument passed to nvim (file or dir)
    local arg = vim.fn.argv(0)

    -- If no argument passed, fallback to current working directory
    local target_dir = arg ~= "" and vim.fn.fnamemodify(arg, ":p") or vim.fn.getcwd()

    -- If it's a file, get its directory
    if vim.fn.isdirectory(target_dir) == 0 then
      target_dir = vim.fn.fnamemodify(target_dir, ":h")
    end

    local session_file = target_dir .. session_dir .. session_file

    if vim.fn.filereadable(session_file) == 1 then
      vim.cmd("source " .. vim.fn.fnameescape(session_file))
    end
  end,
})
