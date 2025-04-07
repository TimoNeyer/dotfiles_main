return {
  "ahmedkhalf/project.nvim",
  lazy = false,
  config = function()
    require("project_nvim").setup({
      sync_root_with_cwd = false,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      patterns = {
        ".project-root.local",
        ".vim.local",
        "LICENCE",
        "README.md",
        "Readme.md",
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        "Makefile",
        "makefile",
        "package.json",
        "build.zig",
        "go.mod",
        "go.sum",
        ".venv",
        "init.lua",
        "cargo.toml",
        "src/",
      },
      vim.keymap.set(
        "n",
        "<leader>po",
        ":Telescope projects<CR>",
        { silent = true, noremap = true, desc = "search Projects" }
      ),
    })
  end,
}
