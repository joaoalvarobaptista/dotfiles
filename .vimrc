" -----------------------------------------------------------------------------
if has('termguicolors')
    set termguicolors
else
    set t_Co=256
endif
" -----------------------------------------------------------------------------
filetype plugin indent on
syntax on
set title
set encoding=utf-8
set backspace=indent,eol,start
set noerrorbells
set confirm
set hidden
set splitbelow
set splitright
set fillchars=vert:│,fold:-,eob:~,lastline:@
" -----------------------------------------------------------------------------
set path=.,**
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" -----------------------------------------------------------------------------
set nowrap
set linebreak
set nolist
set listchars=tab:›-,space:·,trail:◀,eol:↲
" -----------------------------------------------------------------------------
set number 
"set relativenumber
set scrolloff=2
set cursorline
" -----------------------------------------------------------------------------
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"
" -----------------------------------------------------------------------------
set autoindent
set smartindent
" -----------------------------------------------------------------------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" -----------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hls
let @/ = ""
" -----------------------------------------------------------------------------
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

set spelllang=pt_br,en
set nospell

" Insert completion...

" -- Select with arrows up and down --
inoremap <expr> <up> pumvisible() ? '<c-p>' : '<up>'
inoremap <expr> <down> pumvisible() ? '<c-n>' : '<down>'

" -- Accept with right arrow or enter --
inoremap <expr> <right> pumvisible() ? '<c-y>' : '<right>'
inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'

" -- Cancel completion with left arrow --
inoremap <expr> <left> pumvisible() ? '<c-e>' : '<left>'

function! Hashbangs()
    let hb = ['#!/bin/bash', '#!/usr/bin/env bash', '#!/bin/sh', '#!/usr/bin/awk -f']
    call complete(col('.'), hb)
    return ''
endfunction

imap <c-x>h <c-r>=Hashbangs()<cr>
" -----------------------------------------------------------------------------
set wildmenu
set wildmode=longest,full
set wildoptions=pum
" -----------------------------------------------------------------------------
" https://github.com/sainnhe/edge.git 
"set background=light
"colorscheme edge
" -----------------------------------------------------------------------------
"colorscheme habamax
"colorscheme slate
"set background=dark
" -----------------------------------------------------------------------------
set noshowmode
set laststatus=2

hi statusline   cterm=NONE ctermfg=0 ctermbg=7   guibg=#C1C2D0 guifg=#000000
hi statuslinenc cterm=NONE ctermfg=0 ctermbg=240 guibg=#616270 guifg=#000000

augroup ModeEvents
    autocmd!
    au InsertEnter * hi statusline cterm=NONE ctermfg=0 ctermbg=10 guibg=#7BC86F
    au InsertLeave * hi statusline cterm=NONE ctermfg=0 ctermbg=7 guibg=#C1C2D0
    au ModeChanged *:[vV\x16]* hi statusline cterm=NONE ctermfg=0 ctermbg=13 guibg=#C990DC
    au Modechanged [vV\x16]*:* hi statusline cterm=NONE ctermfg=0 ctermbg=7 guibg=#C1C2D0
augroup end

function! LoadStatusLine()

    let g:left_sep='│'
    let g:right_sep='│'

    let g:currentmode={
        \ 'n'  : 'Normal',
        \ 'no' : 'Normal-Operator Pending',
        \ 'v'  : 'Visual',
        \ 'V'  : 'V-Line',
        \ '␖' : 'V-Block',
        \ 's'  : 'Select',
        \ 'S'  : 'S-Line',
        \ '␓' : 'S-Block',
        \ 'i'  : 'Insert',
        \ 'R'  : 'Replace',
        \ 'Rv' : 'V-Replace',
        \ 'c'  : 'Command',
        \ 'cv' : 'Vim Ex',
        \ 'ce' : 'Ex',
        \ 'r'  : 'Prompt',
        \ 'rm' : 'More',
        \ 'r?' : 'Confirm',
        \ '!'  : 'Shell',
        \ 't'  : 'Terminal'
        \}

    set statusline=\ %{toupper(g:currentmode[mode()])}
    " set statusline=\ %{toupper(mode())}
    set statusline+=\ %{left_sep}
    set statusline+=\ %n
    set statusline+=\ %{left_sep}
    set statusline+=\ %f%m\ %y
    set statusline+=\ %{left_sep}
    set statusline+=\ %{&ff}\ %{&fenc!=''?&fenc:&enc}
    set statusline+=\ %{left_sep}
    set statusline+=\ %=
    set statusline+=\ %{right_sep}
    set statusline+=\ %l/%L,%v
    set statusline+=\ %{right_sep}
    set statusline+=\ %P\ 

endfunction

call LoadStatusLine()

" -----------------------------------------------------------------------------
hi Normal guibg=NONE ctermbg=NONE

hi CursorLine guibg=#202130

hi Comment cterm=italic gui=italic

hi VertSplit ctermbg=NONE guibg=NONE ctermfg=7 guifg=#c1c2d0

hi TabLine      guifg=#9192a0 guibg=#303140 gui=none
hi TabLineSel   guifg=#a1a2b0 guibg=#101120 gui=bold
hi TabLineFill  guifg=#9192a0 guibg=#303140 gui=none

hi Visual guifg=NONE guibg=#303140

let g:user_emmet_leader_key=','

" ajustes do emet html
let g:user_emmet_settings = {
\  'variables': {'lang': 'pt-BR'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<meta name=\"description\" content=\"...\">\n"
\              ."\t<meta name=\"author\" content=\"João Alvaro de Souza Baptista\">\n"
\              ."\t<title></title>\n"
\              ."\t<link rel=\"shortcut icon\" href=\"favicon.ico\" type=\"image/x-icon\">\n" 
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

set textwidth=80
set wrap
colorscheme habamax
"colorscheme slate
set background=dark
imap { {}<left>
imap ( ()<left>
imap [ []<left>

"outras conf

call plug#begin('~/.vim/plugged')

" Gerenciador de Arquivos
Plug 'preservim/nerdtree'   " Explorador de arquivos
Plug 'junegunn/fzf', {'do': { -> fzf#install() }} " Pesquisa de arquivos
Plug 'junegunn/fzf.vim'

" Melhorias para edição
" Plug 'jiangmiao/auto-pairs' " Auto fechamento de (), {}, []
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'   " Facilita manipular parênteses e aspas
Plug 'tpope/vim-commentary' " Comentários rápidos com gcc
Plug 'editorconfig/editorconfig-vim' " Segue padrões de formatação

" Suporte para JavaScript e TypeScript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty' " Suporte para React JSX

" Solidity
Plug 'tomlion/vim-solidity' " Realce de sintaxe para Solidity

" Autocompletar com LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-solidity']

" Usa <Tab> para navegar na lista de autocomplete e <Enter> para confirmar
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Atalho para abrir autocomplete manualmente com Ctrl+Espaço
inoremap <silent><expr> <C-Space> coc#refresh()
