"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Eric Liu — @erik1iu
"
" Sections:
"     -> Plugins
"     -> General settings
"     -> Key mappings
"     -> Autocmd
"     -> Misc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" Using Vundle to manage the fzf source.
" See https://vi.stackexchange.com/questions/13718/how-to-install-fzf-vim-with-vundle
Plugin 'junegunn/fzf'

Plugin 'junegunn/fzf.vim'
" Using a terminal buffer instead of raw terminal outputting.
" 40% of screen estate
" See https://github.com/junegunn/fzf.vim/issues/869
let g:fzf_layout = { 'window': 'bot'.float2nr(&lines * 0.4).'new' }

Plugin 'ekalinin/Dockerfile.vim'

" My own plugin for OpenJDK project.
Plugin 'qc1iu/openjdk-ad.vim'

Plugin 'reedes/vim-wordy'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree.git'

Plugin 'itchyny/lightline.vim'

" The tabular plugin must come before vim-markdown.
" See https://github.com/plasticboy/vim-markdown
Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plugin 'vim-scripts/TagHighlight'

Plugin 'majutsushi/tagbar'

Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

" Add a bit extra margin to the left
set foldcolumn=1

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Enable syntax highlighting
syntax on

set t_Co=256

" Set colorscheme to molokai which should be installed by plugin manager.
" Keep silence if molokai not existed.
try
  colorscheme molokai
catch
endtry

" If molokai scheme not be loaded, set the background to dark mode for default
" scheme.
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup

set nowritebackup

set noswapfile

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2

set tabstop=2

" Auto delete indent when go to a new line without input anything.
set autoindent

" Fold mode
set foldmethod=marker

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Always display the status line. Require by 'lightline' plugin
set laststatus=2

" No need show mode in status line again since 'lightline' has done this.
set noshowmode

" Enable enhanced mode in command-line completion
set wildmenu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys in Normal, Visual, Select, Insert modes
" Take care of your 'hjkl' keys:P
" NOTE: Be careful when recurive map to these keys.
noremap   <Up>    <Nop>
noremap   <Down>  <Nop>
noremap   <Left>  <Nop>
noremap   <Right> <Nop>
inoremap  <Up>    <Nop>
inoremap  <Down>  <Nop>
inoremap  <Left>  <Nop>
inoremap  <Right> <Nop>

" Show trailing whitespace
" See https://vim.fandom.com/wiki/Highlight_unwanted_spaces
nnoremap <Leader>tw /\s\+$<CR>

" Quicker change to normal mode
inoremap jk <Esc>

" When the <Esc> is part of a mapping, the command is executed(in cmd mode),
" so we use <C-c> instead.
cnoremap jk <C-c>

""" Window resize
noremap  <C-w>=  :resize +3<CR>

noremap  <C-w>-  :resize -3<CR>

noremap  <C-w>,  :vertical resize -3<CR>

noremap  <C-w>.  :vertical resize +3<CR>

" Quick save.
noremap  <Leader>w :w!<CR>

" Quick exit
noremap  <Leader>q :q!<CR>

" Go to end-of-line in insert & cmd mode
noremap! <C-e> <End>

" Go to head-of-line in insert & cmd mode
noremap! <C-a> <Home>

" Quick open and close NERDTree
inoremap <F3> <Esc>:NERDTreeToggle<CR>

nnoremap <F3> <Esc>:NERDTreeToggle<CR>

" Quick open and close Tagbar
inoremap <F12> <Esc>:TagbarToggle<CR>

nnoremap <F12> <Esc>:TagbarToggle<CR>

" Opens current buffer in new tab page
nnoremap <Leader>s :tab split<CR>

" Make fzf performs more like CtrlP
nnoremap <C-p> :Files<CR>

" Shortcut key for fzf, to change buffer by fuzzing search
nnoremap <Leader>b :Buffers<CR>

" Shortcut key for fzf, v:oldfiles and open buffers
nnoremap <Leader>h :History<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd
"
" NOTE: Put all filetype-specific settings to where they should belong in
" ftplugins floder, because FileType autocmds are pointless and wasteful.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight the current insert line
autocmd InsertEnter,InsertLeave * set cul!

" Open file at the same line
" https://stackoverflow.com/a/775918/5262383
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
