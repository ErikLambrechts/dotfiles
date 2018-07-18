filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/tpope/vim-commentary'             " commentary
Plug 'https://github.com/tpope/vim-surround'               " delete, change and add such surroundings in pairs
Plug 'https://github.com/tpope/vim-repeat'                 " plugins support
Plug 'https://github.com/tpope/vim-endwise'                " compition for contructions
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/tpope/vim-fugitive'                       " git wrapper
Plug 'https://github.com/tpope/vim-obsession'
Plug 'https://github.com/dhruvasagar/vim-prosession'
nmap <Leader>r :Prosession . <CR>
let g:prosession_tmux_title = 0
let g:prosession_on_startup = 0
if has('nvim')
    Plug 'https://github.com/vim-syntastic/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:python3_host_prog = '/usr/bin/python3'
    let g:python2_host_prog = '/usr/bin/python2'
    set inccommand=nosplit  " previeuw subsitutions

    Plug 'https://github.com/machakann/vim-highlightedyank'
    Plug 'https://github.com/roxma/nvim-completion-manager'
endif

if has('nvim')
    Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'https://github.com/zchee/deoplete-jedi'
    Plug 'https://github.com/w0rp/ale'                         " linter
    Plug 'https://github.com/autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }

    Plug 'https://github.com/wellle/tmux-complete.vim'
    Plug 'https://github.com/zchee/deoplete-clang'

    set hidden

    let g:LanguageClient_serverCommands = {
                \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
                \ 'javascript': ['javascript-typescript-stdio'],
                \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
                \ 'python': ['pyls'],
                \ }
    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

    nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    " Or map each action separately
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'https://github.com/Valloric/YouCompleteMe' , { 'do': './install.py' }
endif

Plug 'https://github.com/lervag/vimtex'
" Plug 'https://github.com/vim-latex/vim-latex'  " needs to be before tmux-navigator for  <c-j> intervarence

Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/christoomey/vim-tmux-navigator'

Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/andymass/vim-matchup'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
Plug 'https://github.com/bradford-smith94/quick-scope'
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

Plug 'https://github.com/kshenoy/vim-signature'            " stuff for marks


Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run install script if you use fzf only in Vim.

" Plug 'https://github.com/mileszs/ack.vim'

Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/vim-scripts/a.vim'                " switch .cpp .h
Plug 'https://github.com/nelstrom/vim-visual-star-search'  " search selection
Plug 'https://github.com/mhinz/vim-startify'               " startup screen
Plug 'https://github.com/vim-scripts/Tagbar'               " togle tagbar

Plug 'https://github.com/jpalardy/vim-slime'               " slime : send text to interpreter
Plug 'https://github.com/ddrscott/vim-side-search'         " search over files
Plug 'https://github.com/xtal8/traces.vim'                 " highlight for commands

" Plug 'https://github.com/JuliaEditorSupport/julia-vim'

Plug 'https://github.com/metakirby5/codi.vim'

Plug 'https://github.com/Ron89/thesaurus_query.vim'        " synonims
Plug 'https://github.com/rhysd/vim-grammarous'

"" themes
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/blueyed/vim-diminactive'
Plug 'https://github.com/myusuf3/numbers.vim'              " relitive numbers
Plug 'https://github.com/chriskempson/base16-vim'

Plug 'https://github.com/junegunn/goyo.vim'                " clean centered view
Plug 'https://github.com/junegunn/limelight.vim'           " highlight current paragraf

call plug#end()            " required

filetype plugin indent on    " required
syntax on

"Colorscheme Settings"
let base16colorspace=256
" colorscheme base16-default-dark
" colorscheme base16-default-light
colorscheme base16-bright

" " backup/persistance settings
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

set undolevels=2000                                         " How many undos
set undoreload=2000                                         " number of lines to save for undo
set history=1000                                            " number off ex command to remember
set viminfo='40

set visualbell                                              " Use visual bell instead of beeping when doing something wrong
set novisualbell

set number                                                  " nubers : set absolut on
set relativenumber                                          " nubers : set absolut on

set nostartofline

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
autocmd FileType make setlocal noexpandtab
autocmd FileType sh setlocal noexpandtab
set listchars=tab:>-
set cursorline                                              " Highlight current line

" augroup win_enter
"     autocmd!
"     autocmd WinEnter * set cursorcolumn
" augroup END

" augroup win_leave
"     autocmd!
"     autocmd WinLeave * set nocursorcolumn
" augroup END

highlight Search ctermfg=Black
highlight CursorLineNr ctermbg=0 ctermfg=7 cterm=bold
highlight CursorLine term=bold cterm=bold
highlight Visual cterm=standout,bold
highlight MatchParen cterm=none ctermbg=black ctermfg=white
highlight Pmenu ctermfg=15 ctermbg=245

" Some custom spell-checking colors
highlight SpellBad     term=underline cterm=underline ctermbg=NONE ctermfg=31
highlight SpellCap     term=underline cterm=underline ctermbg=NONE ctermfg=33
highlight SpellRare    term=underline cterm=underline ctermbg=NONE ctermfg=217
highlight SpellLocal   term=underline cterm=underline ctermbg=NONE ctermfg=72

set wrapscan                                                " Wrap around searching
set nowrap
set lazyredraw                                              " Don't redraw while executing macros (good performance config)
set ignorecase                                              " Use case insensitive search, except when using capital letters
set smartcase
set backspace=indent,eol,start                              " Allow backspacing over autoindent, line breaks and start of insert action
set laststatus=2                                            " Always display the status line, even if only one window is displayed
set mouse=a                                                 " Enable use of the mouse for all modes
set showmatch                                               " Show matching brackets when text indicator is over them
set scrolloff=2
set sidescrolloff=12

set hlsearch                                                " trun highlight on
set incsearch                                               " trun highlight on while searching
set showcmd                                                 " shows command
set wildmenu                                                " Make the command-line completion better
set clipboard+=unnamed                                      " Add the unnamed register to the clipboard
set autoread                                                " Automatically read a file that has changed

set foldenable                                              " enable folding
set foldlevelstart=10                                       " open most folds by default
set foldnestmax=10                                          " 10 nested fold max
set foldmethod=indent                                       " fold based on indent level

set shortmess+=I                                            " no splash screen

set completeopt+=noinsert                                   " doe not insert from menu
set nocopyindent                                            " indedent is not recalculated
set sessionoptions-=options

" Types of files to ignore when autocompleting things
set wildignore+=*.o,*.class,*.git,*.svn,*.pyc
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
""gui options"
set guioptions-=m               " remove menu bar
set guioptions-=T               " remove toolbar
set guioptions-=r               " remove right-hand scroll bar
set guioptions-=L               " remove left-hand scroll bar

" line lenght indecators
if (exists('+colorcolumn'))
    set colorcolumn=80,120
    highlight ColorColumn ctermbg=235
endif

" set global mark
call setpos("'V", [bufnr('.vimrc'), 1, 1, 0])

" store and restore folds
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

" foldmethod for python
autocmd FileType python setlocal foldmethod=indent

" select pasted
nnoremap gp `[v`]

" Make Y behave like other capitals
nnoremap Y y$

" easy panel movement -> tmux-navigator
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" increment numbers
noremap + <c-a>
noremap - <c-x>

" alternative esc
inoremap jk <Esc>
inoremap kj <Esc>

" save file as root
cmap w!! w !sudo tee > /dev/null %<CR>

" need to save between tabs
set hidden

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END

" change cursor in different modes
if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' |
    redraw!
    au InsertEnter,InsertChange *
                \ if v:insertmode == 'i' |
                \   silent execute '!echo -ne "\e[6 q"' | redraw! |
                \ elseif v:insertmode == 'r' |
                \   silent execute '!echo -ne "\e[4 q"' | redraw! |
                \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" copy and paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>Y "+Y
nmap <Leader>y "+y
nmap <Leader>Y "+Y
vmap <Leader>d "+d
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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
map <F2> :syn sync clear <CR>

" smart j and k movement
nnoremap <expr> j v:count ?  (v:count > 5 ?  "m'" . v:count : '') .  'j' : 'gj'
nnoremap <expr> k v:count ?  (v:count > 5 ?  "m'" . v:count : '') .  'k' : 'gk'

" dot command on visual selection
xnoremap .  :norm.<CR>

" Apply marco to visual selection
xnoremap Q :'<,'>:normal @q<CR>

" Risize panels when vim is resized
autocmd VimResized * wincmd =

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

"restore view after exicuting arg
function! KeepEx(arg)
  let l:winview = winsaveview()
  execute a:arg
  call winrestview(l:winview)
endfunction

" removing tailing whitespace on file save
augroup prewrites
   autocmd!
    autocmd BufWritePre,FileWritePre *  execute 'normal! ms' | :call KeepEx('silent! %s/\v\s+$//e') | :call histdel("search", -1) | execute 'normal! `s' | delmarks s<CR>
augroup END

" save with sudo rights
cnoremap w!!  w !sudo tee %

" global replace
nnoremap <Leader>s :%s///ge<left><left><left>

" visual select replace
vnoremap <Leader>s :s///ge<left><left><left>

" lists all buffers and opens promt
" nnoremap <Leader>l :ls<cr>:b<space>
" FZF takes this spot

" edit macro
nnoremap <leader>m :<c-u><c-r><c-r>='let @'.  v:register .' = '.  string(getreg(v:register))<cr><c-f><left>

" exicute line as ex-command
nnoremap <Leader>k yy:@"<cr>
vnoremap <Leader>k yy:@"<cr>

" clean hightlight on new search
" nnoremap / :noh<cr>:set hlsearch<cr>/
" nnoremap / :noh<cr>/

" jump assinment end line
au FileType c,cpp,h,hpp set matchpairs+==:;

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
" set undodir=/tmp/.vim-undo-dir
set undodir=~/.vim/undodir
set undofile

" Quickly fix spelling errors choosing the first result
nmap <Leader>z z=1<CR><CR>

" hit ":W" instead of ":w"
command! Q q
command! W w

" highlight double whitelines
match ErrorMsg '\s\+$'

"""""""""""""""""
" Plugin settings
"""""""""""""""""

""" traces

let g:traces_whole_file_range = 0

""" ultisnip, vim-snippets and YCM setting

" autoload snippets
augroup load_ultisnips
  autocmd!
  autocmd FileType python,c,c++,latex call plug#load('ultisnips')
        \| execute 'autocmd! load_ultisnips' | doautocmd FileType
augroup END

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = "context"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:ycm_python_binary_path = '/usr/local/bin/python3'
set runtimepath+=~/.vim/my_snippets/
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_strings = 1

""" tagbar

nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

""" startify

autocmd User Startified setlocal cursorline
let g:startify_custom_header = [
            \ '                               ',
            \ '            __                 ',
            \ '    __  __ /\_\    ___ ___     ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\  ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \  ',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\ ',
            \ '     \/__/    \/_/\/_/\/_/\/_/ ',
\ ]

let g:startify_list_order = [
            \ ['   My most recently used files'],
            \ 'files',
            \ ['   My most recently used files in the current directory:'],
            \ 'dir',
            \ ['   These are my bookmarks:'],
            \ 'bookmarks',
            \ ['   These are my commands:'],
            \ 'commands',
            \ ]

let g:startify_enable_special         = 1
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ '/Users/mhi/local/vim/share/vim/vim74/doc',
            \ ]

let g:startify_bookmarks = [
            \ { 'v': '~/.vimrc' },
            \ { 'z': '~/.zshrc' },
            \ { 'a': '~/.aliases' },
            \ { 't': '~/.tmux.conf' },
            \ { 'b': '~/Dotfiles/bootstrap.sh' },
            \ ]

nnoremap <Leader>v :Startify<CR>
nnoremap <Leader>V :vs<CR>:Startify<CR>

""" A
" nnoremap <Leader>a :Startify<CR>

""" clang

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'

" function! s:initClangCompletePython()
"     if !has('python')
"         echoe 'clang_complete: No python support
"         available.'
"         echoe 'Cannot use clang library'
"         echoe 'Compile vim with python support
"         to use libclang'
"         return 0
"     endif
" endfunc

""" ale

let g:ale_linters = {
\   'python': ['flake8'],
\   'c': ['clang'],
\   'cpp': ['cpplint'],
\}
let g:ale_python_flake8_args = '--ignore=E,W,F403,F405 --select=F,C'
let g:ale_c_clang_options = '-std=c11 -Wall -Wextra -fexceptions -DNDEBUG'
let g:ale_c_cpplint_options = '--linelength=100 -std=c11 -Wall -Wextra -fexceptions -DNDEBUG'
set statusline+=%{ALEGetStatusLine()}
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '%linter%: %s'
" nmap <silent> ]-a <Plug>(ale_previous_wrap)
" nmap <silent> [-a <Plug>(ale_next_wrap)
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

""" slime

let g:slime_target = "tmux"
xmap <c-c> <Plug>SlimeRegionSend
nmap <c-c> <Plug>SlimeMotionSend

""" airline

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', '%4v '])
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

""" sidesearch
 " How should we execute the search?
 " " --heading and --stats are required!
let g:side_search_prg = 'ag --word-regexp'
  \. " --ignore='*.js.map'"
  \. " --heading --stats -B 1 -A 2"

" Can use `vnew` or `new`
 let g:side_search_splitter = 'vnew'

 " I like 40% splits, change it if you don't
 let g:side_search_split_pct = 0.4

 " SideSearch current word and return to original window
 vnoremap <Leader>* y :SideSearch <C-r>"<CR> | wincmd p

 " SideSearch current word and return to original window
 nnoremap <Leader>* :SideSearch <C-r><C-w><CR> | wincmd p

 nnoremap <Leader>/ :SideSearch
 " Create an shorter `SS` command
 " command! -complete=file -nargs=+ SS execute 'SideSearch <args>'

 " or command abbreviation
 " cabbrev SS SideSearch

""" fzf
set rtp+=~/.fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>l :Lines<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>g :GFiles<CR>
nmap <Leader>a :Ag<CR>
nnoremap <Leader>* :Ag <C-r><C-w><CR>
vnoremap <Leader>a y :Ag <C-r>"<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

""" Goyo """

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  set nonumber                                                  " nubers : set absolut on
  set norelativenumber                                          " nubers : set absolut on
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  set number                                                  " nubers : set absolut on
  set relativenumber                                          " nubers : set absolut on
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
