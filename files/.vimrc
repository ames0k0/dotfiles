"======================= PLUG INSTALLATIONS ===========================
call plug#begin('~/.vim/plug')


Plug 'junegunn/goyo.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'

Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'junegunn/fzf.vim', { 'do': 'yes \| ./install' }
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'epeli/slimux'
Plug 'benmills/vimux'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'

Plug 'https://github.com/brooth/far.vim'

" in plan: 
"Plug 'https://github.com/xolox/vim-notes'
"Plug 'https://github.com/xolox/vim-misk'

" Bundle 'pangloss/vim-javascript'


call plug#end()


"======================= AUTO RUN =====================================
" vim -c ':Tmuxline'

"======================= BASIC COMMANDS ===============================
let mapleader=" "

set numberwidth=1
set list
set scrolloff=5
" set autochdir

set lcs=eol:¬,trail:⋅
set rnu
set incsearch
set hlsearch
set ignorecase

set history=500
set showcmd
set visualbell

color space-vim-dark
set encoding=utf-8

" INDENTATION ?
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif

"======================= PLUGIN CONFIGURATION =========================

" #NERDTREE HERE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>


" #YOU COMPLETE ME
let g:ycm_autoclose_preview_window_after_completion=1


" #TAGBAR
nmap <F8> :TagbarToggle<CR>


" #FZF
" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
set rtp+=~/.fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


" #AG
let g:ackprg = 'ag --vimgrep'


" #SURROUND
" cs > change state ?
" ys > yank state ?
" ds > delete state
" ysiw[ -> [ysiw]
" ds[ -> ysiw
" cs]} -> [ysiw] {ysiw}
" yssb -> (yssb)

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


" #PYTHON3 MODE
let g:pymode_python = 'python3'


" #TMUXLINE
let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_preset = {
    \'a'    : '#S',
    \'win'  : ['#I', '#W'],
    \'cwin' : ['#I', '#W', '#F'],
    \'y'    : ['%R', '%a', '%Y'],
    \'z'    : '#H'}


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

" #FAR
set lazyredraw
set regexpengine=1

"============================ FUNCTIONS ===============================
filetype on

autocmd BufNewFile *.sh,*.py exec ":call SetTitle()" 
func SetTitle() 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
        call append(line(".")+1, "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python3")
        call append(line("."),"# -*- coding: utf-8 -*-")
        call append(line(".")+1, "") 
        call append(line(".")+2, "# __author__ = 'kira@-天底 ガジ'")
        call append(line(".")+3, "")
        call append(line(".")+4, "") 
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

"nnoremap <C-i> :call NumberToggle()<cr>
"function! NumberToggle()
"    if(&rnu == 1)
"        set nornu
"    else
"        set rnu
"    endif
"endfunc

" let timer = timer_start(500, 'MyHandler',
"nnoremap <Leader>g :let timer = timer_start(3000, 'ScrollD', {'repeat': 3})<cr>
"func ScrollD(timer)
"    :exec 'normal \<C-e>'
"endfunc
"
