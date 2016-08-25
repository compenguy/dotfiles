" vim:set ft=vim et sw=2:
"
" Load vim-sensible
" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
runtime! plugin/sensible.vim

" Now we do additional customization
set nocompatible

if has("unix")
   set fileformats=unix,dos,mac
   set guifont=Liberation\ Mono\ 8,DejaVu\ Sans\ Mono\ 8
else
   behave mswin
   set keymodel=""
   set fileformats=dos,unix,mac
   set guifont=Lucida_Console:h10:cANSI
   set viminfo=""
endif

" gnome-terminal doesn't advertise its 256-color support, so override it
if $COLORTERM == 'gnome-terminal'
   set t_Co=256
endif

set showmatch      " Show matching encloser - parens, brackets, braces, etc
set hlsearch       " Highlight matching search terms
set smartindent    " Try to be smart about indenting newly-created lines
set copyindent     " Use the same type of whitespace for indentation as
                   " the previous line
set preserveindent " When changing indent of current line, reuse as much of
                   " the existing whitespace as possible
set nobackup       " Don't leave a backup after overwriting an existing file
set nowritebackup  " Don't use a backup file while overwriting an existing file
set noswapfile     " Don't use a swapfile to buffer changes to open files
set autowrite      " When changing buffers, automatically write the contents of
                   " the current buffer
set laststatus=2   " The last window will always have a status line
set ruler          " Always display the current cursor position in the corner
set showmode       " Shows insert, replace, or visual mode
set showcmd        " Shows partial command as it's being entered
set modeline       " Enable per-file modeline comments for per-file vim settings
set list           " Display non-printing characters

colorscheme slate
syntax on          " Get syntax highlighting

" utf handling
if has("multi_byte")
   set encoding=utf-8
   scriptencoding utf-8
   setglobal fileencoding=utf-8
   set nobomb " byte-order-mark, useful for ucs, but not utf
   set termencoding=utf-8 " Latin1 + Euro currency sign
   set fileencodings=ucs-bom,utf-8,iso-8859-1
   " ucs-bom should never come after utf-8
   set listchars=tab:→·,trail:·,extends:»,precedes:«,nbsp:+
endif

" mark lines that are longer than 80 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
" create a vertical rule starting in column 81
" set colorcolumn=81

" Do the right thing for other kinds of files
if has("autocmd")
   autocmd FileType make setlocal noexpandtab
   autocmd FileType html setlocal expandtab|setlocal smarttab|setlocal shiftwidth=2|setlocal tabstop=2|setlocal softtabstop=2
   " Mutt message composition buffers are written to /tmp/mutt*
   autocmd BufRead /tmp/mutt* setlocal textwidth=72|setlocal spell
endif

" Key mappings
"" mapping to be able to move to the left and the right windows 
"" without needing to leave the Ctrl key.
map <C-W><C-Right> <C-W><Right>
map <C-W><C-Left> <C-W><Left>

"" mappings to simplify window and buffer navigation
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><S-h> :bp<CR>
nnoremap <silent><S-l> :bn<CR>

