syntax on

map <Esc><Esc> :w<CR>
map <F11> :tabp<CR>
map <F12> :tabn<CR>

set tabpagemax=100
set showcmd
set t_Co=256
set formatoptions=cr " add comments automatically after hitting enter
set tabstop=2
set shiftwidth=2
set expandtab
set title
set titleold=Pure\ Terminal

" don't overwrite formatoptions
autocmd FileType * setlocal formatoptions<

" 4 spaces for these file types
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4
autocmd FileType c setlocal shiftwidth=4 tabstop=4

let mapleader=','
filetype plugin on
filetype plugin indent on
autocmd BufNewFile,BufRead * setlocal formatoptions-=o
autocmd Filetype gitcommit setlocal spell textwidth=72
set spell   " Global spell checking (set nospell to deactivate), search misspelled with
            " [s or ]s, type zg to add to the exception file <<~/.vim/spell/en.utf-8.add>>

let g:ale_fixers = {}
let g:ale_fixers.python = ['black']
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.scss = ['prettier']
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.javascriptreact = ['prettier']
let g:ale_fixers.typescriptreact = ['prettier']
let g:ale_fixers.typescript = ['prettier']
let g:ale_fixers.json = ['prettier']
let g:ale_fixers.lua = ['stylua']
let g:ale_fixers.cpp = ['astyle']
let g:ale_fixers.c = ['astyle']
let g:ale_fixers.rust = ['rustfmt']
let g:ale_fixers.php = ['pint']
let g:ale_fixers.dart = ['dart-format']
let g:ale_fix_on_save = 1

let g:ale_linters = {}
let g:ale_linters.python = ['pylint', 'flake8']
let g:ale_linters.html = ['htmlhint']
let g:ale_linters.javascript = ['eslint']
let g:ale_linters.typescriptreact = ['eslint']
let g:ale_linters.typescript = ['eslint']
let g:ale_linters.lua = ['luac']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.cpp = ['gcc']
let g:ale_linters.c = ['gcc']
let g:ale_linters.rust = ['analyzer']

"let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_black_options = '--line-length=79'

colorscheme lodestone

" for the error column, high number removes the black bar
hi signColumn ctermbg=300

" Better color for comments with my urxvt colors
hi Comment ctermfg=246

" Show strings in italics
hi String cterm=italic

" Disable italics for screen terminals (tmux running with TERM=screen)
" To fix italics set tmux-256color on .tmux.conf and kill the server
if &term =~'screen'
    hi Comment cterm=NONE
    hi String  cterm=NONE
endif

" Disable background to use my urxvt's bg color
hi Normal ctermbg=NONE

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'dense-analysis/ale'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
Plug 'honza/vim-snippets'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lualine/lualine.nvim'

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'windwp/nvim-ts-autotag'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'tpope/vim-fugitive'

Plug 'windwp/nvim-autopairs'

Plug 'danymat/neogen'

Plug 'yioneko/nvim-yati', {'tag': '*'}

Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

Plug 'github/copilot.vim'

Plug 'marilari88/twoslash-queries.nvim'
call plug#end()

set completeopt=menu,noinsert
