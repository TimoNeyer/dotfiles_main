-- bootstrap lazy.nvim, LazyVim and your plugins
vim.env.PATH = vim.fn.expand("~/.nix-profile/bin") .. ":" .. vim.fn.expand("~/.cargo/bin") .. ":" .. vim.env.PATH
require("config.commands")
require("config.lazy")
