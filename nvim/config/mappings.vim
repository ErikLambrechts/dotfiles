" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" scroll in insert mode
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>

" select pasted
nnoremap gp `[v`]

" Make Y behave like other capitals
nnoremap Y y$

" increment numbers
noremap + <c-a>
noremap - <c-x>

" alternative esc
inoremap jk <Esc>
inoremap kj <Esc>

" save file as root
cnoremap w!! w !sudo tee > /dev/null %<CR>

" change next word
nnoremap cn *``cgn

" use search and ctrl/ to jump to the searched without differnt highliting
function! SearchJump()
    call histdel("search", -1)
    let @/ = histget("search", -1)
    norm h
    if(v:hlsearch) " update " highligthing
        set hlsearch
    endif
endfunction

" jumps to current highlight search result with out setting new pattern
cnoremap <C-_> <CR> :call SearchJump() <CR>

" deletes last searchpattern
nnoremap d/ :call SearchJump() <CR>

" Single key inertion
function!  RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction

" insert SINGLE character
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" redrawn highlights
map <F3> :syn sync clear <CR>

" smart j and k movement
nnoremap <expr> j v:count ?  (v:count > 5 ?  "m'" . v:count : '') .  'j' : 'gj'
nnoremap <expr> k v:count ?  (v:count > 5 ?  "m'" . v:count : '') .  'k' : 'gk'

" dot command on visual selection
xnoremap .  :norm.<CR>

" Apply marco to visual selection
xnoremap Q :'<,'>:normal @q<CR>

" easy asses to blackhole register
nnoremap _ "_
vnoremap _ "_

" n and N recenter when screen jumps
function! s:nice_next(cmd)
    let view = winsaveview()
    execute "normal! " .  a:cmd
    if view.topline != winsaveview().topline
        normal!  zz
    endif
endfunction
nnoremap <silent> n :call <SID>nice_next('n')<cr>
nnoremap <silent> N :call <SID>nice_next('N')<cr>

let mapleader="\<SPACE>"
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>

" copy and paste from system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>Y "+Y
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
vnoremap <Leader>d "+d
nnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" edit macro
nnoremap <leader>m :<c-u><c-r><c-r>='let @'.  v:register .' = '.  string(getreg(v:register))<cr><c-f><left>

nnoremap <Leader>v :Startify<CR>
nnoremap <Leader>V :vs<CR>:Startify<CR>

" SideSearch current word and return to original window
vnoremap <Leader>* y :SideSearch <C-r>"<CR> | wincmd p

" SideSearch current word and return to original window
nnoremap <Leader>* :SideSearch <C-r><C-w><CR> | wincmd p

nnoremap <Leader>/ :SideSearch
nnoremap <Tab>/ :BLines<CR>

nnoremap <Leader>* :Ag <C-r><C-w><CR>
vnoremap <Leader>a y :Ag <C-r>"<CR>

nnoremap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>G :GFiles<CR>
" exicute line as ex-command
nnoremap <Leader>k yy :@"<cr>
vnoremap <Leader>k y :@"<cr>
nnoremap <Leader>r :Prosession . <CR>
" global replace
nnoremap <Leader>s :%s///ge<left><left><left>
" visual select replace
vnoremap <Leader>s :s///ge<left><left><left>
" Quickly fix spelling errors choosing the first result
nnoremap <Leader>z z=1<CR><CR>

nnoremap <Leader>gt :Tags<CR>

nnoremap <leader>qs <plug>(QuickScopeToggle)
nnoremap <leader>tz :Goyo<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>ts :set spell! <CR>  :set spelllang=en <CR>
nnoremap <Leader>tsn :set spell! <CR> :set spelllang=nl <CR>
nnoremap <Leader>th :set hls! <CR>

" difftools
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif
""" tagbar

nnoremap <F8> :TagbarToggle<CR>

""" startify
" let g:ale_statusline_format = ['E %d', 'W %d', '  ok']
nnoremap <silent> ]w <Plug>(ale_previous_wrap)
nnoremap <silent> [w <Plug>(ale_next_wrap)
nnoremap <silent> ]W <Plug>(ale_first)
nnoremap <silent> [W <Plug>(ale_last)

xmap <c-c>  <Plug>SlimeRegionSend
nnoremap <c-c>  <Plug>SlimeParagraphSend
nnoremap <c-c>  <Plug>SlimeMotionSend
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" " Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
"             \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
"              fzf#wrap({'dir': expand('%:p:h')}))
