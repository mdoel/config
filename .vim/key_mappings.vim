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
  nmap <leader>ek :e ~/.vim/key_mappings.vim<cr>
  nmap <leader>ev :e ~/.vim/general_config.vim<cr>

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
  nmap <Leader>tt :FufFile<cr>
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
