"Needed for plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins begin here
call plug#begin('~/.vim/plugged')

"Nvim plugins here
  if has('nvim')
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'w0rp/ale'
  endif

"Shougo Plugins
  Plug 'Shougo/deoplete-zsh'
  Plug 'Shougo/denite.nvim'

"Tim Pope Plugins
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
	
"Visual Plugins
  Plug 'rakr/vim-one'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'majutsushi/tagbar'
  Plug 'godlygeek/tabular'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
  Plug 'flazz/vim-colorschemes'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'yggdroot/indentline'
  Plug 'chriskempson/base16-vim'
  Plug 'ErichDonGubler/vim-sublime-monokai'
  Plug 'tomasiser/vim-code-dark'

"Syntax
  Plug 'fatih/vim-go'
  Plug 'sheerun/vim-polyglot'
  Plug 'elzr/vim-json'

"Code Maneuverabiliity
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'junegunn/fzf'
  Plug 'mattn/emmet-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'airblade/vim-rooter'

"Other Plugins
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'wokalski/autocomplete-flow'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'chiel92/vim-autoformat'


"Plugins end here
call plug#end()

"Basic settings
syntax on
filetype plugin indent on
set shiftwidth=2
set autoindent
set smartindent
set lazyredraw
set number relativenumber
set laststatus=2
set noshowmode
set hlsearch
set incsearch
set ignorecase
set smartcase
set softtabstop=2
set expandtab
set nowrap

"Add true colors
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"Atom CS Toggle
set background=dark
let g:one_allow_italics = 1
colorscheme one
let g:airline_theme='one'

"Sublime CS Toggle
"colorscheme sublimemonokai
"let g:airline_theme='badwolf'

"Badwolf CS Toggle
"colorscheme badwolf

"Enable deoplete plugin
let g:deoplete#enable_at_startup = 1

"Enable ultisnips
let g:UltiSnipsUsePythonVersion=3

"Ale settings
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '%linter% says %s'


"Mappings
let mapleader=" "
map <leader><tab> :NERDTreeToggle<CR>
nmap <leader>\ :TagbarToggle<CR>
nmap <leader><leader> :FZF<CR>
nmap <leader>f :FZF! ~<CR>
nnoremap <tab><tab> <c-w>w
nmap <leader>sv :vsp<CR>
nmap <leader>sh :sp<CR>
nmap <leader>qq :q!<CR>
nmap <leader>qa :qa!<CR>
nmap <leader>ww :w<CR>
nmap <leader>wa :wa<CR>
nmap <leader>xx :x<CR>
nmap <leader>xa :xa<CR>
nmap <leader>Cb :colorscheme badwolf<CR>:AirlineTheme badwolf<CR>
nmap <leader>Co :colorscheme one<CR>:AirlineTheme onedark<CR>
nmap <leader>Cs :colorscheme sublimemonokai<CR>:AirlineTheme badwolf<CR>
nmap <leader>Pi :PlugInstall<CR>
nmap <leader>Pu :PlugUpdate<CR>
nmap <leader>Pc :PlugClean<CR>
map <Leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-bd-w)
nmap J <C-d>
nmap K <C-u>
nmap <leader>( ysiw(
nmap <leader>) ysiw)
nmap <leader>[ ysiw[
map <leader>] ysiw]
nmap <leader>c cs

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

"Mouse enable and smooth scroll
set mouse=a
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(20)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-20)<CR>
let g:comfortable_motion_friction = 270.0 

"let g:comfortable_motion_scroll_down_key = "j"
"let g:comfortable_motion_scroll_up_key = "k"
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <C-k> :bnext<cr>
map <C-j> :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<tab> :tabnext<cr>

"Emmet Mapping
map <leader>e <C-y>,

"Eunuch Mapping
map <leader>fm :Mkdir 
map <leader>fn :e 

"Git Mapping
map <leader>Ga :Gwrite <CR>
map <leader>Gc :Gcommit -m ""<Left>
map <leader>Gp :Gpush <CR>
map <leader>Gs :Gstatus <CR>

"Autoformat Mapping
map <leader>A :Autoformat<CR>

"Airline Powerline Fonts
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
 "air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1

let g:airline_theme = 'onedark'

"FZF Window Size
let g:fzf_layout = { 'down': '~20%' }

"Javascript Syntax
let g:javascript_plugin_flow = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

