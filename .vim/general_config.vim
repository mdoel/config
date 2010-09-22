let mapleader = ","

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
