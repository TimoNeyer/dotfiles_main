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

-- static session management
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local full_path = vim.fn.getcwd() .. "/" .. session_file
    if vim.fn.filereadable(full_path) == 1 then
      vim.cmd("source " .. vim.fn.fnameescape(full_path))
    end
  end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local cwd = vim.fn.getcwd()

    -- Create .vim.local directory if it doesn't exist
    if vim.fn.isdirectory(session_dir) == 0 then
      vim.fn.mkdir(session_dir, "p")
    end

    -- Save the session
    vim.cmd("mksession! " .. vim.fn.fnameescape(cwd .. "/" .. session_file))
  end,
})
