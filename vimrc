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

" Editor configuration
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Git/GitHub support
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

" Python support
Plugin 'python-mode/python-mode'
Plugin 'python/black'
Plugin 'integralist/vim-mypy'

" Other language/syntax support
Plugin 'vim-scripts/nginx.vim'
Plugin 'smerrill/vcl-vim-plugin'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/Css-Pretty'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/groovy.vim'
Plugin 'elzr/vim-json', {'for': 'json'}
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'IN3D/vim-raml'
Plugin 'hashivim/vim-terraform'
Plugin 'chrisbra/csv.vim'

" Framework specific
Plugin 'parkr/vim-jekyll'
Plugin 'vim-scripts/django.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'tfnico/vim-gradle'
Plugin 'mfukar/robotframework-vim'

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

" Visual {{{
set background=dark
set number
set showmatch " Show matching brackets
set noerrorbells " No noise

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=0
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
" }}}

" Got to module/class/function definition
map <leader>j :RopeGotoDefinition<CR>

" On some files, draw a line on column limit
au FileType python,javascript,go set colorcolumn=79
" For 'text' files (like Markdown) let's use a more confortable limit
au FileType rst,mkd,markdown set colorcolumn=72

set shell=/usr/local/bin/zsh

" Plugin configuration
"

" Airline {{{
let g:airline_section_y=''
let g:airline_section_z = airline#section#create(['linenr', ':%3v'])
" }}}

" NERDTree {{{
let NERDTreeIgnore=['\.o$', '\~$', '\.py[co]$', '__pycache__', '[\._]*\.s[a-w][a-z]$', '[\._]s[a-w][a-z]$']
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <leader>t <ESC>:NERDTreeToggle<CR>
" }}}

" NERD Commenter {{{
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" }}}

" Pymode {{{
let g:pymode = 1
let g:pymode_folding = 0 " Disable python folding (make vim slow)
let g:pymode_utils_whitespaces = 0 " Don't autoremove unused whitespaces
" Don't open error window automatically
" let g:pymode_lint_cwindow = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
" Disable rope / autocomplete to avoid vim freeze
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0
let g:pymode_python = 'python3'
" }}}

" Dockerfile syntax highlight
au BufRead,BufNewFile Dockerfile.* set ft=dockerfile

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

" Ale {{{
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '⚠️'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" }}}

" EditorConfig {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }}}

" Go {{{
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
let g:go_fold_enable = ["block", "import", "varconst", "package_comment"]
" }}}

" Terraform {{{
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
" }}}
