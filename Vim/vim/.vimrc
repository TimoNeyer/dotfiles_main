    " VARIABLES ------------------------------------------------------------ {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype off

" Enable plugins and load plugin for the detected file type.
filetype plugin indent on

" Turn syntax highlighting on.
syntax on

" Disable all bells
set noerrorbells visualbell t_vb=

" Add numbers to each line on the left-hand side.
set number relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Show color column at 80 characters width
set colorcolumn=80

" Rendering.
set ttyfast

" Allow hidden buffers.
set hidden

" Set tab width to 4 columns.
set tabstop=4

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

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

    call plug#begin('~/.vim/plugged')
        Plug 'ervandew/supertab'
        Plug 'preservim/nerdtree'
       " Plug 'dense-analysis/ale'

    call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

    " shortcuts navigation
    inoremap jj <esc>
    nnoremap <space> :
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l


    " shortcuts editing
    nnoremap O o<esc>
    nnoremap Q q!
    nnoremap W w!

    " mappings plugins
      " Nerdtree
        nnoremap <F3> :NERDTreeToggle<cr>
        let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']


" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

augroup basicfold
    autocmd! 
    autocmd FileType * setlocal foldmethod=indent
augroup END 

  augroup filetype_vim
      autocmd!
      autocmd FileType vim setlocal foldmethod=marker
  augroup END

  augroup filetype_py
      autocmd! 
      autocmd FileType py setlocal foldmethod=indent
  augroup END 

  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
  augroup END


" }}}

" STATUS LINE ------------------------------------------------------------ {{{

      set statusline=
      set statusline+=\ \%F\ %M\ %Y\ %R
      set statusline+=%=
      set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
      set laststatus=2

" }}}

" COMMANDS ----------------------------------------------------------------{{{{{{
      
      command! Update :source ~/.vimrc
      command! Py :!/usr/bin/python3 %
      command! W : w!
      command! Q : q!

" }}}}}}

" Colorscheme:
colorscheme molokai
