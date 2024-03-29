" Enable theme
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:polyglot_disabled = ['elm']

"plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'https://github.com/joshdick/onedark.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'https://github.com/scrooloose/nerdtree.git'
	Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdcommenter'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'dense-analysis/ale'
  Plug 'airblade/vim-gitgutter'
  Plug 'mhinz/vim-startify'
  Plug 'ap/vim-buftabline'
  Plug 'lervag/vimtex'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'elmcast/elm-vim'
call plug#end()

" mute onedark theme colors
let g:onedark_color_overrides = {
\ "black": {"gui": "#1a1f25", "cterm": "235", "cterm16": "0" },
\ "red": {"gui": "#c6787e", "cterm": "131", "cterm16": "1"},
\ "green": {"gui": "#819d6c", "cterm": "114", "cterm16": "2" },
\ "yellow": {"gui": "#cda377", "cterm": "130", "cterm16": "3"},
\ "blue": {"gui": "#5cadf1", "cterm": "117", "cterm16": "4"},
\ "purple": {"gui": "#b080be", "cterm": "140", "cterm16": "5"},
\ "cyan": {"gui": "#67adb7", "cterm": "80", "cterm16": "6"},
\}
let g:onedark_terminal_italics = 1 " enable italics
let g:onedark_hide_endofbuffer = 1 " hide ~ after eof
let g:go_fmt_command = "goimports"
" enable syntax highlighting for Go
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
syntax on
if (has("autocmd"))
  augroup colorextend
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight("goFunctionCall", { "fg": { "gui": "#67adb7"} })
    autocmd ColorScheme * call onedark#extend_highlight("Type", { "fg": { "gui": "#b080be" } })
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "fg": { "gui": "#5cadf1" } })
  augroup END
endif
colorscheme onedark

" Some custom mappings
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nmap <> :NERDTreeToggle<CR>
map <C-w>j <C-W>j
map <C-w>k <C-W>k
map <C-w>h <C-W>h
map <C-w>l <C-W>l
map <C-s> :set showtabline=2<CR>
map <C-d> :set showtabline=0<CR>
:command NT NERDTree

" cursor settings
set guicursor=a:hor20

" elm
let g:elm_format_autosave = 1

" vim-tex
let g:tex_flavor = 'latex'

" Status bar settings
set background=dark
set statusline=%=%c\ %f\ %m\ %P
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
hi StatusLine guibg=None

" Change default NERDTree arrows for directories
let g:NERDTreeDirArrowExpandable = '·'
let g:NERDTreeDirArrowCollapsible = '·'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" config column next to line numbers
hi clear SignColumn
hi SignColumn ctermbg=235
hi Default ctermfg=1

" NERDTree colours
hi Directory guifg=#c0c0c0
hi NERDTreeDirSlash guifg=#777777
hi NERDTreeCWD guifg=#cccccc
hi NerdTreeFlags guifg=#aa9269

" FocusMode *Wip* doesn't work well with NERDTree on
function! ToggleFocusMode()
  if (&foldcolumn != 3)
    set laststatus=0
    set numberwidth=5
    set foldcolumn=3
    set noruler
    set nonumber
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    set number
  endif
endfunc
nnoremap <C-f>m :call ToggleFocusMode()<cr>

" Ale settings
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '!'
highlight ALEWarningsign guifg=#cda377
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {'cpp': ['g++']}
let g:ale_cpp_cc_options = '-Wall -O2 -std=c++17'

" enable autocomplete for Vimtex with YouCompleteMe
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" misc settings
set wildmenu
set linebreak
set mouse=a
set number
set tabstop=4       " The width of a TAB is set to 2.
set shiftwidth=4    " Indents will have a width of 2
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set smarttab	      " :help smarttab
set foldmethod=syntax
set foldlevelstart=20
