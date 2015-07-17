" Disable vi compatibility mode
set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
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
" Plugin 'Lokaltog/powerline'
Plugin 'chrisbra/csv.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'parkr/vim-jekyll'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-vividchalk'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on

set encoding=utf-8
" Window background
set background=dark
set hlsearch
set incsearch
" Show line numbers
set number
" Enable syntax highglight
syntax on
filetype plugin indent on

" Color scheme
colorscheme vividchalk

" Emulate TextMate's shift left/right key commands
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Got to module/class/function definition
map <leader>j :RopeGotoDefinition<CR>

" Show invisible caracters
set list
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Default tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" On some files, draw a red line on column limit
au FileType python,javascript,php set colorcolumn=79
" For 'text' files (like Markdown) let's use a more confortable limit
au FileType mkd set colorcolumn=72

au FileType puppet set tabstop=2
au FileType puppet set softtabstop=2
au FileType puppet set shiftwidth=2
au FileType puppet set expandtab

" Plugin configuration
"

" Powerline plugin
" https://github.com/Lokaltog/vim-powerline
"
" Always show status line
set laststatus=2
" File has trailing whitespaces
"call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" NERDTree
" https://github.com/scrooloose/nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.o$', '\~$', '\.py[co]$']
map <leader>t <ESC>:NERDTreeToggle<CR>

" Enable python folding
let g:pymode_folding = 1

" Don't autoremove unused whitespaces
let g:pymode_utils_whitespaces = 0

" Don't open error window automatically
" let g:pymode_lint_cwindow = 0
let g:pymode_lint = 1
let g:pymode_lint_write = 0

" Nginx syntax highlight
au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx 
au BufRead,BufNewFile /Users/rcmachado/Developer/nginx-conf/* set ft=nginx 

" Sass-syntax
au BufRead,BufNewFile *.scss set filetype=scss

" Jekyll
let g:jekyll_post_extension = '.md'

" Reformat json using python
au FileType json setlocal equalprg=python\ -m\ json.tool

" Autocomplete
set omnifunc=syntaxcomplete#Complete
set completefunc=emoji#complete

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = "$HOME" . '/.pyenv/versions/3.4.3/bin/python3' 
