
" Theme
" -----

" Enable 256 color terminal
set t_Co=256
colorscheme base16-bright

set cursorline                                              " Highlight current line

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


" Enable true color
if has('termguicolors')
	set termguicolors
endif

" line lenght indecators
if (exists('+colorcolumn'))
    set colorcolumn=80,120
    highlight ColorColumn ctermbg=235
endif

if has('gui_running')
	set background=dark
	set lines=40
	set columns=150
endif

function! s:theme_reload(name)
	let theme_path = $VIMPATH.'/themes/'.a:name.'.vim'
	if filereadable(theme_path)
		execute 'source' fnameescape(theme_path)
		" Persist theme
		call writefile([g:colors_name], s:cache)
	endif
endfunction

" THEME NAME
let g:theme_name = 'rafi-2017'
autocmd MyAutoCmd ColorScheme * call s:theme_reload(g:theme_name)

" " COLORSCHEME NAME
" let s:cache = $VARPATH.'/theme.txt'
" if ! exists('g:colors_name')
" 	set background=dark
" 	execute 'colorscheme'
" 		\ filereadable(s:cache) ? readfile(s:cache)[0] : 'hybrid'
" endif

" vim: set ts=2 sw=2 tw=80 noet :
