" ======================== Vundle Config =================

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"          _ __  __          __
"   ____ _(_) /_/ /_  __  __/ /_
"  / __ `/ / __/ __ \/ / / / __ \
" / /_/ / / /_/ / / / /_/ / /_/ /
" \__, /_/\__/_/ /_/\__,_/_.___/
"/____/ ----- Vim Bundles -------
"

Bundle 'SeanThomasWilliams/dwm.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'benekastah/neomake'
Bundle 'benmills/vimux'
Bundle 'benmills/vimux-golang'
Bundle 'bling/vim-airline'
Bundle 'einars/js-beautify'
Bundle 'fatih/vim-go'
Bundle 'gagoar/StripWhiteSpaces'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kien/ctrlp.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'marijnh/tern_for_vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'veegee/cql-vim'
Bundle 'vim-scripts/vimwiki'

"+----------------- Basic Configurations ------------+
" GUI Configuration
if has('gui_running')
    set spell " Spelling looks ugly in command line mode
    set spelllang=en_us " We speak amuurican
    set guioptions-=T
    "set guioptions=+M "Turn off annoying bars
    set guioptions+=LlRrb "Some kind of hack for scrollbars
    set guioptions-=LlRrb
    set guifont=Terminus\ 10
endif

" Vim-Script Configurations
let g:indent_guides_guide_size = 1 " Only use one column to show indent
let g:indent_guides_start_level = 2 " Start on the second level of indents

" Keymappings
" Quick write, write quit and quit key mappings for normal mode
nmap <leader>w :write<CR>
nmap <leader>wq :write <bar> :quit<CR>
nmap <leader>q :quit<CR>

" Location list mappings
nmap <silent><leader>lc :lcl<CR>
nmap <silent><leader>lo :lw<CR>

" Quick search and replace
nmap  S  :%s//g<LEFT><LEFT>

" Quick copen/cclose
nnoremap <silent> <Leader>c :cclose<CR>
nnoremap <silent> <Leader>C :copen<CR>

" Autocommands that cant live in after/filetypes
if has('autocmd')
    autocmd BufNewFile,Bufread *.wsgi set ft=python
    autocmd BufNewFile,Bufread *.spect set ft=spec
    autocmd BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4
    autocmd BufNewFile,BufRead *.js setlocal et ts=4 sw=4 sts=4
    " Beautify
    autocmd FileType javascript nnoremap <leader>f :call JsBeautify()<cr>
    autocmd FileType html nnoremap <leader>f :call HtmlBeautify()<cr>
    autocmd FileType css nnoremap <leader>f :call CSSBeautify()<cr>
    " Make
    autocmd! BufWritePost,BufEnter * Neomake
endif

au VimResized * :wincmd = " Resize splits when the window is resized

" ARROW KEYS ARE UNACCEPTABLE
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" If there is a vimrc.local source that before current
if filereadable(expand("~/.vimrc.local"))
      source ~/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
if exists('+relativenumber')
	set relativenumber
endif

if has('persistent_undo')
    set undolevels=5000
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
endif

set autoindent
set autoread                    " Automatically reread changed files without asking me anything
set autowrite                   " Automatically save before :next, :make etc.
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backup " Store temporary files in a central spot
set backupdir=~/.vim/tmp/backup// " backups
set cmdheight=2
set complete=.,w,b,u,t " Better Completion
set completeopt=longest,menuone,preview " Better Completion Options
set cursorline " Show highlight on the cursor line
set diffopt+=iwhite
set directory=~/.vim/tmp/swap//   " swap files
set encoding=utf8 " We write unicode so use utf8
set errorbells
set expandtab " Always use soft tabs
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set hidden "If I close a buffer dont delete the changes
set history=10000
set hlsearch "Highlight results of a search
set ignorecase "Dont care about case when searching
set incsearch " Show search results while doing /
set laststatus=2 " Always have a status line regardless
set lazyredraw
set nolist " Don't use the listchars
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⋅
set magic
set matchtime=3
set modelines=0
set nocompatible
set noerrorbells                " No beeps
set noshowmode " Always show mode
set noswapfile                    " it's 2013, Vim.
set number
set numberwidth=5
set pastetoggle=<F4>
set scrolloff=3 " keep moreiabbrev lmis ಠ‿ಠearch matches in the middle of the window.
set shell=bash " This makes RVM work inside Vim. I have no idea why.
set shiftround " Round intentations to the nearest shiftwidth
set shiftwidth=4
set showbreak=↪
set showcmd " display incomplete commands
set showmatch
set showtabline=2
set smartcase
set smartindent " Be smart when indenting
set softtabstop=4
set splitbelow                  " Split horizontal windows below to the current windows
set splitright                  " Split vertical windows right to the current windows
set switchbuf=useopen
set synmaxcol=128 " Don't try to highlight lines longer than X characters.
set t_Co=256 " If in terminal use 256 colors
set t_ti= t_te= " Prevent Vim from clobbering the scrollback buffer. See
set tabstop=4
set tags=~/.tags,./tags " Look for tags in this file
set textwidth=120
set timeoutlen=250
set title "Show a window title
set ttyfast
set updatecount=10
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore=*.swp,*.bak,*.pyc " Set wildignore to hid swp, bak and pyc files
set wildignore+=*.sw?                            " Vim swap files
set wildmenu " make tab completion for files/buffers act like bash
set wildmode=list:full
set winminheight=0
set winwidth=79

syntax case match
syntax sync minlines=256
syntax on " Enable highlighting for syntax

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" Make directories automatically if they don't already exist.
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

" Center on c-o
nnoremap <c-o> <c-o>zz

" Don't auto-jump on *
nnoremap * *<c-o>

" COLOR
set background=dark
color inkpot

" STATUS LINE
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PyLint
"augroup ftpy
"   autocmd!
"   autocmd FileType python compiler pylint
"augroup end

"let g:pylint_inline_highlight = 0
"let g:pylint_onwrite = 0
"let g:pylint_signs = 0

nnoremap <silent> <Leader>p :Pylint<CR> :copen<CR>
nnoremap <silent> <Leader>P :call Pep8()<CR> :copen<CR>
nnoremap <silent> <Leader>c :cclose<CR>
nnoremap <silent> <Leader>C :copen<CR>

" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC FUNCTIONS

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Insert the current time
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

cabbrev hsplit split
cabbrev new vnew
cabbrev right botright
cabbrev sta vertical sta

" MISC KEY MAPS
nnoremap <silent> <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F5> <ESC>:w<CR>:call CallInterpreter()<CR>

map <F11> :!ctags -R -f ./tags . &<CR>

" Call godoc on keyword
nnoremap <silent><Leader>d :Godoc<CR>

"omnicomplete
inoremap <C-Space> <C-X><C-I>

" Resize splits
nnoremap <silent> = :exe "vertical resize " . (winwidth(0) * 4/3)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 3/4)<CR>

map <leader>y "*y

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

nnoremap <leader><leader> <c-^>

"omnicomplete
inoremap <C-Space> <C-X><C-I>

"Ctrl-ArrowKeys = move between splits
nnoremap <C-Down> <C-W><down>
nnoremap <C-Left> <C-W><left>
nnoremap <C-Right> <C-W><right>
nnoremap <C-Up> <C-W><up>

nnoremap <C-\> :call DWM_New() <bar> :CtrlPCurWD<CR>
nnoremap <C-C> :call DWM_Close()<CR>
nnoremap <C-A> :call DWM_Focus()<CR>

"clear highlight search
nmap <silent> <leader><space> :nohlsearch<CR>
nnoremap <silent> <Leader>s :StripWhiteSpaces<CR>

"Fix shell expansion with putty
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

"tab handling
nnoremap <Leader>t :tab sp<CR>
nnoremap <Leader>w :tabc<CR>

"make Y behave more like C and D
nmap Y y$

" Ack features
nnoremap <Leader>a :Ack --type=%:e
nnoremap <Leader>A :Ack --type=%:e <C-r><C-w><CR>

" CtrlP
"let g:ctrlp_working_path_mode = 2
"let g:ctrlp_extensions = ['dir']
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_mruf_max=450        " number of recently opened files
let g:ctrlp_max_files=0         " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn|resources|build)$',
\ 'file': '\v\.(exe|so|dll|swp|swo|pyc|orig|jpg|png)$',
\ }
let g:ctrlp_buftag_types = {
            \ 'go'         : '--language-force=go --golang-types=ftv',
            \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
            \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
            \ 'objc'       : '--language-force=objc --objc-types=mpci',
            \ 'rc'         : '--language-force=rust --rust-types=fTm'
            \ }
nnoremap <C-t> :CtrlPCurWD<CR>

" ctrl-n/m to jump between 'compiler' messages
nnoremap <silent> <C-n> :cn<CR>
nnoremap <silent> <C-m> :cp<CR>

" fix syntax hl:
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" ------------------------------------------"
" Plugin Settings
" ----------------------------------------- "

" YCM settings
let g:ycm_autoclose_preview_window_after_insertion = 1

" Golang
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au FileType go map <Leader>gi :wa<CR> :GoImports<CR>
au FileType go map <Leader>b :wa<CR> :GoBuild<CR>
au FileType go map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
au FileType go map <Leader>rf :wa<CR> :GolangTestFocused<CR>
au FileType go nmap <Leader>d <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

" Tern
au FileType javascript nmap gd :TernDef<CR>
au FileType javascript nmap <Leader>d :TernDefSplit<CR>
au FileType javascript nmap <Leader>i :TernDoc<CR>

" Go settings
let g:go_auto_type_info = 1
let g:go_dispatch_enabled = 0
let g:go_fmt_fail_silently = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_jump_to_error = 1
let g:go_play_open_browser = 0
let g:go_term_mode = "split"

" Tern
let g:tern_map_keys = 1
let g:tern_map_prefix = '<leader>'
let g:tern_show_argument_hints='on_hold'

" Syntastic plugin (Deprecate vs neomake?)
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['govet']
let g:syntastic_javascript_checkers = ['jshint']

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint', 'jshint']
let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'WarningMsg',
    \ }


" Firefox refresh
"let g:firefox_refresh_files = "*.js"
"let $firefox_refresh_host = "webclient"

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_mode_map = {} " see source for the defaults
