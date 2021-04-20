" enter the current millemium
set nocompatible

" Colors
syntax enable " some machines need this
colorscheme elflord " best color scheme


" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**


" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer from :ls


" TAG JUMPING:
" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


" AUTOCOMPLETE
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with the path trick)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" SNIPPETS:
" Put each snippet in its own file in home/.vim/ 
" Then you can create a map for that snippet
" Use <CR> to automatically complete the command
" Then you can do kk to move up 2 lines afterwards or w/e
nnoremap ,test :-1read $HOME/.vim/.test<CR>


" UI Config
set number " show line numbers
set showcmd " show last command in bottom right
set wildmenu " visual autocomplete for command menu
set showmatch " highlights the matching [ { ( ) } ]
set smartindent " indent, but smarter


" Spaces & Tabs
set expandtab " insert spaces instead of tabs
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab while editting
set shiftwidth=2 " number of spaces to use while shifting


" Searching
set incsearch " search as characters are entered
set hlsearch " highlight matches

" press enter to clear search highlighting
nnoremap <CR> :noh<CR><CR>


" Folding
set foldenable " enable folding
set foldlevelstart=99 " open all folds by default
set foldnestmax=99 " maximum number of nested folds allowed

" <space> to open/close folds
nnoremap <space> za

" folds everything up to the current indentation level
set foldmethod=indent


" Movement
" move down 1 line
nnoremap j gj

" move up 1 line
nnoremap k gk

" move to beginning of line
nnoremap B ^

" move to end of line
nnoremap E $

" map $ to nothing
nnoremap $ <nop>

" map ^ to nothing
nnoremap ^ <nop>

" jk is escape
inoremap jk <esc>


" My custom stuff
" use w!! to save as sudo
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!<CR>

" toggle between absolute and relative line numbers
map ln :set number! relativenumber!<CR>

" Disable bell during insert mode, to avoid beep with 'showmatch'
" Source: https://code.google.com/p/vim/issues/detail?id=319
augroup NoBellDuringInsert
	au!
	au InsertEnter * :call SetBell(1)
	au InsertLeave * :call SetBell(0)
augroup END

fun! SetBell(disable)
	if a:disable
		let s:mybell = [&eb, &vb, &t_vb]
		" need to set visualbell, else bell will still be called
		set noeb vb t_vb=
	else
		let [&eb, &vb, &t_vb] = s:mybell
	endif
endfun
