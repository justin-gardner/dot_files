" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-buftabline'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
call plug#end()

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif


set t_Co=256
set t_ut=


" sane text files
set fileformat=unix
set fileencoding=utf-8


" enter the current millemium
set nocompatible


" Colors
colorscheme elflord " best color scheme


" highlight errors as red text with yellow background, no idea where the yellow comes from but whatever
hi SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#0000ff


" SNIPPETS
" Put each snippet in its own file in home/.vim/
" Then create a map for that snippet
nnoremap ,pydoc :-1read $HOME/.vim/.pydocstring<CR>
nnoremap ,vue :-1read $HOME/.vim/.vue<CR>


" UI Config
set relativenumber " show line numbers
set showcmd " show last command in bottom right
set showmatch " highlights the matching [ { ( ) } ]


" Spaces & Tabs
set expandtab " insert spaces instead of tabs
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab while editting
set shiftwidth=4 " number of spaces to use while shifting
set viminfo='25,\"50,n~/.viminfo
autocmd fileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd fileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd fileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd fileType javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd fileType vue setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd fileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2


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


" move through split windows
nmap <leader>k :wincmd k<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>


" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bp<CR>:bd #<CR>


" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" nerdtree settings
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()


" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8', 'pydocstyle', 'bandit', 'mypy']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort']
\}
let g:LanguageClient_serverCommands = {'vue': ['vls']}
let g:ale_fix_on_save = 1


" tags
map <leader>t :TagbarToggle<CR>


"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


" remove trailing whitespace
function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre *
    \ :call <SID>StripTrailingWhitespaces()


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
