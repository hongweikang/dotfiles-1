set nocompatible  " Use Vim settings, rather then Vi settings
filetype off      " Required for Vundle setup

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'
Bundle 'steffanc/a.vim'
Bundle 'steffanc/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline'

filetype plugin indent on     " required!

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set binary
set cursorline cursorcolumn
set expandtab
set formatoptions-=t
set hidden
set hlsearch
set history=700
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nomodeline
set noswapfile
set nowritebackup
set number
set pastetoggle=<F2>
set ruler
set shiftround
set shiftwidth=4
set shortmess+=r
set showmode
set smartcase
set smartindent
set splitright
set splitbelow
set tabstop=4
set tags=./tags;/
set textwidth=79
if exists('+undodir')
    set undodir=$HOME/.vim/undodir
    set undofile
endif
set wrap

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has('gui_running')
   set vb
   set guioptions-=T
   set guioptions-=r
   set go-=L
endif

" Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

"" Syntax and colours
syntax enable
if $TERM == "xterm-256color"
    set t_Co=256
    colorscheme wombat256mod
else
    colorscheme wombat
endif

" Leader tricks
let mapleader=','
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>d :sh<cr>

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ve :vsp $MYVIMRC<CR>
nnoremap <silent> <Leader>vs :source $MYVIMRC<CR>

" Search helpers
map <space> /
map <c-space> ?
"search current selection
:vmap / y/<C-R>"<CR>
 
" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ctags commands
nnoremap <Leader>wt :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <Leader>wv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <Leader>wr :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .; cscope -bR;<cr><cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

" PLUGINS
" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Ack plugin
" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of ACK if we
" have it if we have it
if executable("ag")
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
nnoremap <Leader>ff :Ack! 
nnoremap <Leader>fw #*:AckFromSearch!<CR>
" search selection
vmap <Leader>ff /##*:AckFromSearch!<CR>

" NERD Tree
nnoremap <Leader>r :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.os$', '\.o$', '\.pyc$','\~$']

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|pyc|os|swp|orig|bak)$'}
if executable("ag")
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Fugitive
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>ge :Gedit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gw :Gbrowse<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gl :Glog<cr>

" a.vim
"switches to the header file corresponding to the current file being edited (or vise versa)
nnoremap <Leader>aa :A<cr>
"splits and switches
nnoremap <Leader>as :AS<cr>
"vertical splits and switches
nnoremap <Leader>av :AV<cr>
":AT new tab and switches
nnoremap <Leader>at :AT<cr>
":AN cycles through matches
nnoremap <Leader>an :AN<cr>
":IH switches to file under cursor
nnoremap <Leader>ai :IH<cr>
":IHS splits and switches
nnoremap <Leader>ais :IHS<cr>
":IHV vertical splits and switches
nnoremap <Leader>aiv :IHV<cr>
":IHT new tab and switches
nnoremap <Leader>ait :IHT<cr>
":IHN cycles through matches
nnoremap <Leader>ain :IHN<cr>

"" YouCompleteMe
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_key_detailed_diagnostics = '<Leader>u'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'

" Plugin key-mappings.

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#complete_common_string()

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Haskell post write lint and check with ghcmod
" $ `cabal install ghcmod` if missing and ensure
" ~/.cabal/bin is in your $PATH.
if !executable("ghcmod")
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
endif

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
