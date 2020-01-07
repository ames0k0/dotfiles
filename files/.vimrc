"======================= PLUG INSTALLATIONS ===========================
call plug#begin('~/.vim/plug')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'

Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'

Plug 'epeli/slimux'
Plug 'benmills/vimux'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colour dracula
" Plug 'dracula/vim', { 'name': 'dracula'  }
Plug 'jacoborus/tender.vim'


call plug#end()


let g:airline_theme="serene"
" behelt -> bold
" serene -> just colors (without background-shadow)


"======================= BASIC COMMANDS ===============================
let mapleader=" "

set numberwidth=1
set list
set scrolloff=5
set belloff=all
" set autochdir

set encoding=utf-8
set lcs=eol:¬,trail:⋅
set rnu
set incsearch
set hlsearch
set ignorecase

set history=500
set showcmd
set visualbell

" INDENTATION ?
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

color tender
syntax enable
set background=dark

set cursorline

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif

"======================= PLUGIN CONFIGURATION =========================

" #NERDTREE HERE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"map <C-n> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>


" #TAGBAR
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30

" #SURROUND
" cs > change state ?
" ys > yank state ?
" ds > delete state
" ysiw[ -> [ysiw]
" ds[ -> ysiw
" cs]} -> [ysiw] {ysiw}
" yssb -> (yssb)



" AG
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


" #ACK.VIM
"?    a quick summary of these keys, repeat to close
"o    to open (same as Enter)
"O    to open and close the quickfix window
"go   to preview file, open but maintain focus on ack.vim results
"t    to open in new tab
"T    to open in new tab without moving to it
"h    to open in horizontal split
"H    to open in horizontal split, keeping focus on the results
"v    to open in vertical split
"gv   to open in vertical split, keeping focus on the results
"q    to close the quickfix window


let g:python_highlight_all = 1


" #INDENTLINE
let g:indentLine_char = '┆'


" #VIM-EASY-ALIGN
nmap ga <Plug>(EasyAlign)

" #NERDCOMMENTER
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 0
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'p': { 'left': '# '} }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" #SLIMUX
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>


" #VIM-MULTIPLE-CURSOR, DEFAULT CONFIG
" let g:multi_cursor_use_default_mapping=0
"
" " Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'"


"============================ FUNCTIONS ===============================
filetype on


autocmd BufNewFile *.sh,*.py,*txt exec ":call SetTitle()"
func SetTitle() 

    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
        call append(line(".")+1, "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python3")
        call append(line("."),"# -*- coding: utf-8 -*-")
        call append(line(".")+1,"")
        call append(line(".")+2,"")
    elseif &filetype == 'text'
        call setline(1,"; author: <kira@-天底_ガジ>")
        call append(line("."), "; ." . strftime('%m-%d') . ":  ---------------")
        call append(line(".")+1, "..")
    endif

endfunc 
autocmd BufNewFile * normal G

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc
