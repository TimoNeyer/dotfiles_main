return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'asm',
        'css', 'go', 'ini', 'json', 'python', 'regex',
        'sql', 'ssh_config', 'toml', 'xml', 'yaml', 'zig' },
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  }
