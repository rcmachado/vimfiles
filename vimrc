" Disable vi compatibility mode
set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" Plugins {{{
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'smerrill/vcl-vim-plugin'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/mako.vim'
Plugin 'mattn/zencoding-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/Css-Pretty'
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'claco/jasmine.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/csv.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'parkr/vim-jekyll'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-vividchalk'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'markcornick/vim-bats'
Plugin 'vim-scripts/django.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'vim-scripts/groovy.vim'

call vundle#end()
" }}}

set encoding=utf-8
set clipboard+=unnamed " Yanks go on clipboard instead

" Match and search {{{
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch
" }}}

" Formatting {{{
syntax on
filetype plugin indent on

set backspace=indent,eol,start

" Default tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}

" Visual "{{{
set background=dark
set number " Show line numbers
set showmatch " Show matching brackets
set noerrorbells " No noise

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
" set foldlevel=1 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

" Show invisible caracters
set list
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" First run: only load color scheme if plugin was already downloaded
if isdirectory(expand("~/.vim/bundle/vim-vividchalk/.git"))
    colorscheme vividchalk
endif
" "}}}

" Emulate TextMate's shift left/right key commands
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Got to module/class/function definition
map <leader>j :RopeGotoDefinition<CR>

" On some files, draw a red line on column limit
au FileType python,javascript,php set colorcolumn=79
" For 'text' files (like Markdown) let's use a more confortable limit
au FileType mkd,markdown set colorcolumn=72

au FileType puppet set tabstop=2
au FileType puppet set softtabstop=2
au FileType puppet set shiftwidth=2
au FileType puppet set expandtab

set shell=/usr/local/bin/zsh

" Plugin configuration
"

" Always show status line
set laststatus=2
" File has trailing whitespaces
"call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" NERDTree
let NERDTreeIgnore=['\.o$', '\~$', '\.py[co]$', '__pycache__']
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <leader>t <ESC>:NERDTreeToggle<CR>

" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Enable python folding
let g:pymode_folding = 1

" Don't autoremove unused whitespaces
let g:pymode_utils_whitespaces = 0

" Don't open error window automatically
" let g:pymode_lint_cwindow = 0
let g:pymode_lint = 0
let g:pymode_lint_write = 0

" Disable rope / autocomplete to avoid vim freeze
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

" Nginx syntax highlight
au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx 
au BufRead,BufNewFile /Users/rcmachado/Developer/nginx-conf/* set ft=nginx 

" Sass-syntax
au BufRead,BufNewFile *.scss set filetype=scss

" Django syntax
au BufRead,BufNewFile /Users/rcmachado/Developer/**/templates/**/*.html set ft=htmldjango

" Jekyll
let g:jekyll_post_extension = '.md'

" Reformat json using python
au FileType json setlocal equalprg=python\ -m\ json.tool

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = "$HOME" . '/.pyenv/versions/3.5.1/bin/python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_sh_shellcheck_args = "--external-sources --exclude=SC2148"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
