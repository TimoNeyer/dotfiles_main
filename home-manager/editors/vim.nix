{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      #supertab
      nerdtree
      ale
      vim-gitgutter
      fzf-vim
      zoxide-vim
      lightline-vim
      vim-lightline-coc
      onedark-vim
      nord-vim
      tender-vim
      coc-vimlsp
      coc-clangd
      coc-rust-analyzer
    ];
    extraConfig = ''
" VARIABLES ------------------------------------------------------------ {{{

let g:mapleader = "\<Space>"

" Fix some terminal related stuff
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

set guicursor=n-v-c:block-Cursor,n-v-c:blinkon0,i:blinkwait10


" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype off

" Enable plugins and load plugin for the detected file type.
filetype plugin indent on

" Turn syntax highlighting on.
syntax on

" Disable all bells
set noerrorbells visualbell t_vb=0

" Add numbers to each line on the left-hand side.
set number relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set nocursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=2

" Show color column at 80 characters width
" set colorcolumn=80

" Rendering.
set ttyfast

" Allow hidden buffers.
set hidden

" Set tab width to 4 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" when searching case insensitive
set ic

" set default splitting orientation
set splitright
set splitbelow

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

    let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

    let g:mkdp_auto_start = 0
    let g:mkdp_auto_close = 1

    let g:lightline = { 'colorscheme': 'tender' }

    let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
    \ }


    " ALE
    let g:ale_enabled = 1
    let g:ale_sign_column_always = 1
    let g:ale_lint_on_text_changed = 'always'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_list_window_size = 5
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 1
    let g:ale_completion_enabled = 1
    let g:ale_cpp_cc_executable = 'clang++'
    let cpp_options = '-std=c++17 -Wall -Wextra -pedantic'
    let g:ale_cpp_cc_options    = cpp_options
    let g:ale_cpp_gcc_options   = cpp_options
    let g:ale_cpp_clang_options = cpp_options
    let g:ale_cpp_clangd_options = '--clang-tidy'
    let g:ale_c_clangd_executable = 'clangd'
    let g:ale_cpp_clangd_executable = 'clangd'
    let g:ale_c_enabled_linters = ['clangd']
    let g:ale_cpp_enabled_linters = ['clangd']
    let g:ale_linters = {
    \   'python': ['flake8', 'mypy'],
    \   'c': ['gcc', 'clang'],
    \   'cpp': ['clang++', 'g++'],
    \}
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'python': ['autopep8', 'isort'],
    \   'c': ['clang-format'],
    \   'cpp': ['clang-format'],
    \   'zig': ['zigfmt']
    \}
    let g:ale_statusline_format = ['E: %d', 'W: %d', 'Ok']
    let g:ale_set_highlights = 1

  hi ALEErrorLine   ctermbg=239 cterm=underline
  hi link ALEError SpellBad
  hi link ALEErrorSign Error

  hi ALEWarningLine ctermbg=237 cterm=underline
  hi link ALEWarning SpellBad
  hi link ALEWarningSign Error

  hi ALEInfoLine ctermbg=235 cterm=underline
  hi link ALEInfo SpellBad
  hi link ALEInfoSign Error

  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚠'
  let g:ale_sign_info = 'ℹ'
  let g:ale_sign_style_error = 'S'

  let g:zig_fmt_parse_errors = 0

" }}}

" KEYMAPS --------------------------------------------------------------- {{{

    " shortcuts navigation
    inoremap jj <Esc>
    inoremap <C-BS> <C-W>

    nnoremap <C-c> +y
    nnoremap <C-v> +p
    nnoremap <C-l> <C-W>l
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap x "_x
    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap <C-D> <C-D>zz
    nnoremap <C-U> <C-U>zz
    nnoremap <Esc><Esc> <Esc>:noh<CR>
    nnoremap <C-S> <cmd>w<CR>
    nnoremap <C-Q> <cmd>wqa<CR>

    vnoremap p "_dP"


    " Nerdtree
    nnoremap <F3> :NERDTreeToggle<cr>
    " MardownPreview
    nnoremap <F4> :MarkdownPreviewToggle<cr>
    " fzf
    nnoremap <c-o> :FZF<cr>
    nnoremap <leader><Space> :GFiles .<cr>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
    augroup filetype_vim
      autocmd!
      autocmd FileType vim setlocal foldmethod=marker
    augroup END

    augroup filetype_py
      autocmd!
      autocmd FileType py setlocal foldmethod=indent
      command -range Comment <line1>,<line2>s/^/#/
      command -range Uncomment <line1>,<line2>s/^#//
    augroup END

    augroup remember_folds
        autocmd!
        autocmd BufWinLeave * mkview
        autocmd BufWinEnter * silent! loadview
    augroup END

    augroup filetype_md
        autocmd FileType md setlocal set tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType md setlocal let g:vim_markdown_new_list_item_indent = 0
        autocmd FileType md setlocal set expandtab number ruler autoindent smartindent
        autocmd Filetype md setlocal syntax off
    augroup END

" }}}

" COMMANDS ----------------------------------------------------------------{{{{{{

      command! Update :source ~/.vimrc
      command! W : w!
      command! Q : q!

" }}}}}}

" Colorscheme:
       colorscheme tender
    '';
  };

  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
