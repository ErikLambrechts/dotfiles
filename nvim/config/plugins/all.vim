" Plugin Settings
"---------------------------------------------------------
if dein#tap('tagbar')
	nnoremap <silent> <Leader>o   :<C-u>TagbarOpenAutoClose<CR>
	" Also use h/l to open/close folds
	let g:tagbar_map_closefold = ['h', '-', 'zc']
	let g:tagbar_map_openfold = ['l', '+', 'zo']
endif

let g:UltiSnipsSnippetsDir = "~/Dotfiles/vim/.vim/my_snippets/"
let g:UltiSnipsEditSplit = "context"

" autoload snippets
augroup load_ultisnips
    autocmd!
    autocmd FileType python,c,c++,latex call plug#load('ultisnips')
                \| execute 'autocmd! load_ultisnips' | doautocmd FileType
augroup END

let g:SuperTabDefaultCompletionType = "context"
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
set runtimepath+=~/.vim/my_snippets/
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" if dein#tap('vim-operator-surround')
" 	map <silent>sa <Plug>(operator-surround-append)
" 	map <silent>sd <Plug>(operator-surround-delete)
" 	map <silent>sr <Plug>(operator-surround-replace)
" 	nmap <silent>saa <Plug>(operator-surround-append)<Plug>(textobj-multiblock-i)
" 	nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" 	nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
" endif

" if dein#tap('vim-operator-replace')
" 	xmap p <Plug>(operator-replace)
" endif

" if dein#tap('vim-operator-flashy')
" 	map y <Plug>(operator-flashy)
" 	nmap Y <Plug>(operator-flashy)$
" endif

" if dein#tap('vim-niceblock')
" 	xmap I  <Plug>(niceblock-I)
" 	xmap A  <Plug>(niceblock-A)
" endif

" if dein#tap('accelerated-jk')
" 	nmap <silent>j <Plug>(accelerated_jk_gj)
" 	nmap <silent>k <Plug>(accelerated_jk_gk)
" endif

" if dein#tap('vim-sidemenu')
" 	nmap <Leader>l <Plug>(sidemenu)
" 	xmap <Leader>l <Plug>(sidemenu-visual)
" endif

" if dein#tap('vim-indent-guides')
" 	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
" endif

" if dein#tap('vim-bookmarks')
" 	nmap ma :<C-u>cgetexpr bm#location_list()<CR>
" 		\ :<C-u>Denite quickfix -buffer-name=list<CR>
" 	nmap mn <Plug>BookmarkNext
" 	nmap mp <Plug>BookmarkPrev
" 	nmap mm <Plug>BookmarkToggle
" 	nmap mi <Plug>BookmarkAnnotate
" endif

" if dein#tap('committia.vim')
" 	let g:committia_hooks = {}
" 	function! g:committia_hooks.edit_open(info)
" 		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
" 		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

" 		setlocal winminheight=1 winheight=1
" 		resize 10
" 		startinsert
" 	endfunction
" endif

" if dein#tap('python_match.vim')
" 	nmap <buffer> {{ [%
" 	nmap <buffer> }} ]%
" endif

if dein#tap('goyo.vim')
	nnoremap <Leader>G :Goyo<CR>
endif

" if dein#tap('vim-peekaboo')
" 	nnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  0)<cr>
" 	xnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  1)<cr>
" 	nnoremap <buffer> <silent> @ :<c-u>call peekaboo#peek(v:count1, 'replay', 0)<cr>
" 	inoremap <buffer> <silent> <c-r> <c-o>:call peekaboo#peek(1, 'ctrl-r',  0)<cr>
" endif

" if dein#tap('vimwiki')
" 	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
" endif

" if dein#tap('vim-choosewin')
" 	nmap -         <Plug>(choosewin)
" 	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
" endif

" if dein#tap('jedi-vim')
" 	let g:jedi#completions_command = ''
" 	let g:jedi#documentation_command = 'K'
" 	let g:jedi#goto_command = '<C-]>'
" 	let g:jedi#goto_assignments_command = '<leader>g'
" 	let g:jedi#rename_command = '<Leader>r'
" 	let g:jedi#usages_command = '<Leader>n'
" endif

" if dein#tap('vim-gitgutter')
" 	nmap <Leader>hj <Plug>GitGutterNextHunk
" 	nmap <Leader>hk <Plug>GitGutterPrevHunk
" 	nmap <Leader>hs <Plug>GitGutterStageHunk
" 	nmap <Leader>hr <Plug>GitGutterUndoHunk
" 	nmap <Leader>hp <Plug>GitGutterPreviewHunk
" endif

" if dein#tap('vimagit')
" 	nnoremap <silent> mg :Magit<CR>
" 	" autocmd MyAutoCmd FileType magit
" 	" 	\ nnoremap <silent><buffer> <CR> za
" endif

" if dein#tap('vim-easygit')
" 	nnoremap <silent> <leader>gd :Gdiff<CR>
" 	nnoremap <silent> <leader>gD :Gdiffoff<CR>
" 	nnoremap <silent> <leader>gc :Gcommit<CR>
" 	nnoremap <silent> <leader>gb :Gblame<CR>
" 	nnoremap <silent> <leader>gB :Gbrowse<CR>
" 	nnoremap <silent> <leader>gS :Gstatus<CR>
" 	nnoremap <silent> <leader>gp :Gpush<CR>
" endif

" if dein#tap('undotree')
" 	nnoremap <Leader>gu :UndotreeToggle<CR>
" endif

" if dein#tap('vim-online-thesaurus')
" 	nnoremap <silent> <Leader>K :<C-u>OnlineThesaurusCurrentWord<CR>
" endif

" if dein#tap('vim-asterisk')
" 	map *   <Plug>(asterisk-g*)
" 	map g*  <Plug>(asterisk-*)
" 	map #   <Plug>(asterisk-g#)
" 	map g#  <Plug>(asterisk-#)

" 	map z*  <Plug>(asterisk-z*)
" 	map gz* <Plug>(asterisk-gz*)
" 	map z#  <Plug>(asterisk-z#)
" 	map gz# <Plug>(asterisk-gz#)
" endif

" if dein#tap('vim-expand-region')
" 	xmap v <Plug>(expand_region_expand)
" 	xmap V <Plug>(expand_region_shrink)
" endif

" if dein#tap('sideways.vim')
" 	nnoremap <silent> m" :SidewaysJumpLeft<CR>
" 	nnoremap <silent> m' :SidewaysJumpRight<CR>
" 	omap <silent> a, <Plug>SidewaysArgumentTextobjA
" 	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
" 	omap <silent> i, <Plug>SidewaysArgumentTextobjI
" 	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
" endif

" if dein#tap('splitjoin.vim')
" 	let g:splitjoin_join_mapping = ''
" 	let g:splitjoin_split_mapping = ''
" 	nmap sj :SplitjoinJoin<CR>
" 	nmap sk :SplitjoinSplit<CR>
" endif

" if dein#tap('linediff.vim')
" 	vnoremap ,df :Linediff<CR>
" 	vnoremap ,da :LinediffAdd<CR>
" 	nnoremap ,ds :<C-u>LinediffShow<CR>
" 	nnoremap ,dr :<C-u>LinediffReset<CR>
" endif

" if dein#tap('dsf.vim')
" 	nmap dsf <Plug>DsfDelete
" 	nmap csf <Plug>DsfChange
" endif

" if dein#tap('vim-commentary')
" 	xmap <Leader>v  <Plug>Commentary
" 	nmap <Leader>v  <Plug>CommentaryLine
" 	xmap gc  <Plug>Commentary
" 	nmap gc  <Plug>Commentary
" 	omap gc  <Plug>Commentary
" 	nmap gcc <Plug>CommentaryLine
" 	nmap cgc <Plug>ChangeCommentary
" 	nmap gcu <Plug>Commentary<Plug>Commentary
" endif

" if dein#tap('vim-textobj-multiblock')
" 	omap <silent> ab <Plug>(textobj-multiblock-a)
" 	omap <silent> ib <Plug>(textobj-multiblock-i)
" 	xmap <silent> ab <Plug>(textobj-multiblock-a)
" 	xmap <silent> ib <Plug>(textobj-multiblock-i)
" endif

" if dein#tap('vim-textobj-function')
" 	omap <silent> af <Plug>(textobj-function-a)
" 	omap <silent> if <Plug>(textobj-function-i)
" 	xmap <silent> af <Plug>(textobj-function-a)
" 	xmap <silent> if <Plug>(textobj-function-i)
" endif

" vim: set ts=2 sw=2 tw=80 noet :
