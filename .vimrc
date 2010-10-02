set nocompatible
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

filetype plugin indent on


let mapleader = ","

nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<cr>

" Proper character type
  scriptencoding utf-8

" Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

" have one hundred lines of command-line (etc) history:
  set history=100

" Show us the command we're typing
  set showcmd

" Highlight matching parens
  set showmatch
  set completeopt=menu,preview
  
" Use the tab complete menu
  set wildmenu 
  set wildmode=list:longest,full

" have the mouse enabled all the time:
  set mouse=a

" don't make it look like there are line breaks where there aren't:
  set nowrap

" use indents of 2 spaces, and have them copied down lines:
  set expandtab
  set tabstop=2
  set softtabstop=2 
  set shiftwidth=2

  set autoindent
  
" Set to auto read when a file is changed from the outside
  set autoread

" show the `best match so far' as search strings are typed:
  set incsearch
  set showmatch
  set hlsearch
  nnoremap <leader><space> :noh<cr>

" searching is case insensitive when all lowercase
  set ignorecase
  set smartcase
 
" assume the /g flag on :s substitutions to replace all matches in a line:
  set gdefault

" use non-VIM regular expressions
nnoremap / /\v
vnoremap / /\v

" make backspace work in insert mode
  set backspace=indent,eol,start

" remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" show me where I am
set ruler
set cursorline
" set cursorcolumn

" work with faster tty's
set ttyfast

" always include at least 3 lines of context around current line
set scrolloff=3

" always have a status line
set laststatus=2

" show invisibles
set list
set listchars=tab:▸\ ,eol:¬

" save when focus is lost
au FocusLost * :wa

" hide buffers instead of closing them
set hidden

" flip the default split directions to sane ones
set splitright
set splitbelow

" dont beep for errors
set visualbell

" augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

" When lines are cropped at the screen bottom, show as much as possible
set display=lastline

" pick up external file modifications
set autoread


" enable line numbers
  set number
  setlocal numberwidth=3

" These two enable syntax highlighting
  set nocompatible
  syntax on
  
" terminal-compatible colorscheme
  " colors ir_black



" get out of insert mode with cmd-i
  imap <D-i> <Esc>

" redo with U
  nmap U :redo<cr>

" easy wrap toggling
  nmap <Leader>w :set wrap<cr>
  nmap <Leader>W :set nowrap<cr>

" switch windows
  nmap gj j
  nmap gk k
  nmap gh h
  nmap gl l

" switch tabs
  nmap gH :tabp<cr>
  nmap gL :tabn<cr>

" close all other windows (in the current tab)
  nmap gW :only<cr>


" close all other tabs
  nmap gT :tabonly<cr>

" previous/next buffer (for going without tabs)
  nmap g[ :bp<cr>
  nmap g] :bn<cr>

" ack for project-wide searching
  nmap g/ :LAck! 
  nmap g* :LAck! <C-R><C-W>
  nmap ga :LAckAdd! 
  nmap gn :lnext<cr>
  nmap gp :lprev<cr>

" shortcuts for frequenly used files
  nmap gs :e db/schema.rb<cr>
  nmap gr :e config/routes.rb<cr>
  nmap ge :e config/environment.rb<cr>

" align pipe-separated tables for cucumber or textile with g| in visual mode
  vmap g\| :Align \|<cr>

" insert blank lines without going into insert mode
  nmap go o<esc>
  nmap gO O<esc>

" scroll up/down one line at a time
  nmap <Up> 
  nmap <Down> 

" Fuzzy Finder
  let g:fuf_file_exclude = '\v\~$|\.(png|gif|jpg|o|exe|dll|bak|swp)$|(^|[/\\])\.(vendor|coverage|tmp|doc|hg|git|bzr)($|[/\\])|\/$'
  let g:fuf_keyOpenTabpage = '<S-CR>'
  let g:fuf_keyOpenVsplit = '<D-CR>'
  " nmap <Leader>tt :FufFile<cr>
  nmap <Leader>b :FufBuffer<cr>
  " nmap <Leader>f :FufRenewCache<cr>

" CommandT
  let g:CommandTMatchWindowAtTop=1
  let g:CommandTAcceptSelectionVSplitMap='<D-CR>' 
  let g:CommandTAcceptSelectionTabMap='<S-CR>'
  let g:CommandTMaxHeight=30
  set wildignore+='*.o,*.obj,.git,script/**,doc/**,vendor/**,coverage/**,tmp/**,*.gif,*.png,*.jpg'
  nmap <Leader>t :CommandT<cr>
  nmap <Leader>f :CommandTFlush<cr>

  nmap <Leader>n :NERDTree<cr>

" use tab in normal/visual modes to bounce between parens/braces/brackets
nnoremap <tab> %
vnoremap <tab> %

" get back to normal mode when accidentally hitting F1 instead of ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" strip all trailing whitespace from the current file
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" wrap paragrphs of text
vmap Q gq
nmap Q gqap

" reselect pasted text so we can perform commands like indentation on it
nnoremap <leader>v V`]

" get out of insert mode more quickly
inoremap jj <ESC>

nmap <Leader>c :copen<CR>
nmap <Leader>cc :cclose<CR>

" reselect items after indending in visual mode
vmap > >gv

" allow tabs to indent in visual mode
vmap <Tab> >
vmap <S-Tab> <gv

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" rails.vim mappings
map <Leader>oc :Rcontroller<Space>
map <Leader>ov :Rview<Space>
map <Leader>om :Rmodel<Space>
map <Leader>ou :Runittest<Space>
map <Leader>oh :Rhelper<Space>
map <Leader>oj :Rjavascript<Space>
map <Leader>os :Rstylesheet<Space>



" attempt to load a custom config for the currently logged in user
runtime! custom_config/`whoami`.vim
