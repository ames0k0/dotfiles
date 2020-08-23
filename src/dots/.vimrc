call plug#begin('~/.vim/plug')

Plug 'mhinz/vim-startify'   " welcome page
Plug 'morhetz/gruvbox'      " color

Plug 'jiangmiao/auto-pairs' " adding closing things
Plug 'tpope/vim-surround'   " adding opening and closing things
Plug 'tpope/vim-repeat'     " repeating last thing with dot -> '.'

"                           " commenting multiple lines
Plug 'scrooloose/nerdcommenter'
"                           " make it pretty with delimiters
Plug 'junegunn/vim-easy-align'
"                           " search, easy to go to the target
Plug 'easymotion/vim-easymotion'

"                           " find & edit multiple target
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'    " taglist for PL
"                           " compilations, linters and fixers for PL
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"                           " indentation for python (*auto-pairs)
Plug 'Vimjas/vim-python-pep8-indent'

"                           " fuzzyfinder, searching for files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'      " searching in files
Plug 'Yggdroot/indentLine'  " line for each scope (block, recursion block)

Plug 'epeli/slimux'         " sending command, selected thing to the tmux
"                           " status symbols for changes
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'   " git commands in vim

call plug#end()


" ======================= System Config ========================= "
set encoding=utf-8
set history=500
set autochdir               " change directory for this pane
set nowrap                  " let line go out of window
set scrolloff=5             " on 5th line on top/down will show next line
set visualbell              " no sound
set belloff=all             " no sound
"                           " ignoring these file extensions on tab completion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif
set colorcolumn=80,100      " vertical line, *(cursorcolumn) like
let mapleader=" "           " changing default ('/') leader key to (' ')

" VISUAL geo
set nu
set rnu
set lcs=eol:¬,trail:⋅
set list
set numberwidth=1           " limited spaces for line number

" SEARCHING
set hlsearch                " highlight what i'm searching
set incsearch               " find what i'm typing
set ignorecase              " ignore A-Za-z

" on FILES
set autoindent              " keeps the same level as current line start
set smartindent             " making it smarter
set shiftwidth=4
set softtabstop=4
set tabstop=4

filetype plugin indent on

"                           " BufRead - on reading
autocmd BufNewFile,BufRead * exec ":call SettingsForFile()"
func SettingsForFile()
    "                       " highlight for lcs
    highlight SpecialKey guibg=DeepPink

    if &filetype == 'python'
        "                   " python3 | pydoc
        set keywordprg=pydoc3
    elseif &filetype == 'javascript'
        set tabstop=2
        set softtabstop=2
        set shiftwidth=2
    endif
endfunc

set smarttab                " omg
set expandtab               " replaces tab with spaces

"                           " BufNewFile - on creating new file
autocmd BufNewFile *.sh,*.py,*txt exec ":call TitleForFile()"
"                           https://github.com/ma6174/vim/
func TitleForFile()
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
        " SEE:
        " https://vi.stackexchange.com/questions/17704/how-to-remove-character-returned-by-system
        call setline(1,"; author: <" . substitute(system("git config --global user.name"), '\n', '', 'g') . ">")
        call append(line("."), "; c_date: " . strftime('%Y-%m-%d'))
        call append(line(".")+1,"")
    endif
endfunc

"                           " go down after writing title
autocmd BufNewFile * normal G
syntax on                   " syntax highlighting


" ======================= Plugin Config ========================= "
" GRUVBOX
if exists('+termguicolors') " use better color bits
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
let g:gruvbox_contrast_dark='hard'
color gruvbox
set background=dark


" AUTO-PAIRS
let g:AutoPairsFlyMode = 1


" NERDCOMMENTER
let g:NERDSpaceDelims = 1   " Spase after adding comment symbol
"                           " python adding it by syntax, so adding default
let g:NERDCustomDelimiters = {
    \'python': { 'left': '#', 'right': '' }
    \}
"                           " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
"                           " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"                           " Allow commenting and inverting empty lines (useful when commenting a region)
"                           " but not checking for starting and ending of region
let g:NERDCommentEmptyLines = 1


" VIM-EASYALIGN
nmap ga <Plug>(EasyAlign)


" VIME-ASYMOTION
" map  / <Plug>(easymotion-sn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)


" TAGBAR
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 35


" COC-NVIM
"                           " Error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"                           " Created place (as it's name says)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


set hidden                  " TextEdit might fail if hidden is not set.
set nobackup                " Some servers have issues with backup files, see #649.
set nowritebackup


" ZFZ
let g:fzf_layout = {'down': '30%'}
"                            " github files
nnoremap <leader>g :GFiles<CR>
"                            " local files
nnoremap <leader>f :Files<CR>


" INDENTLINE
let g:indentLine_char = ':'


" ACK + AG
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


" SLIMUX
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>
