syntax on

map <Esc><Esc> :w<CR>
map <F11> :tabp<CR>
map <F12> :tabn<CR>

" To use tabs on makefiles use ctrl+v, tab
"inoremap <S-Tab> <C-V><Tab> 

set tabpagemax=100
set showcmd
set noesckeys " ultrafast ESC + O
set t_Co=256
set formatoptions=cr " add comments automatically after hitting enter
set formatoptions-=o " do not add comments when hitting o
set tabstop=4
set shiftwidth=4
set expandtab
set title
set titleold=Pure\ Terminal

" 2 spaces for these file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2

let mapleader=','
filetype plugin on
filetype plugin indent on
autocmd BufNewFile,BufRead * setlocal formatoptions-=o
autocmd Filetype gitcommit setlocal spell textwidth=72
set nospell   " Global spell checking (set nospell to deactivate), search misspelled with
            " [s or ]s, type zg to add to the exception file <<~/.vim/spell/en.utf-8.add>>

colorscheme lodestone

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
