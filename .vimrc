if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" --------------------
"  plugin install
" --------------------
call plug#begin('~/.vim/plugged')

" rust language
Plug 'rust-lang/rust.vim', {'for': 'rust'}
" javascript language
Plug 'pangloss/vim-javascript', {'for': 'javascript'}

" colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'

" linestatus
Plug 'itchyny/lightline.vim'

" syntax checker
Plug 'vim-syntastic/syntastic'

" file navigation: <Leader>-n
Plug 'preservim/nerdtree'

" comment: gc, <Leader>-c-c
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'

" version contral
Plug 'tpope/vim-fugitive'

call plug#end()

" --------------------
" general
" --------------------

" basic
syntax on
filetype plugin indent on

" colorscheme
if has('gui_running')
    set background=dark
else
    set background=light
endif
let g:solarized_termcolors=256
set guifont=Monaco:h18
colorscheme solarized

" <leader>
let mapleader = ";"

" --------------------
"  user interface
" --------------------

" line number
set nu " number lines
set rnu " relative line numbering

" search
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set ignorecase
set smartcase

" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" tab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" indent
set ai "Auto indent
set si "Smart indent

" line
set lbr " line break
set wrap "Wrap lines
" height current line
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" window
set splitbelow
set splitright
" guiwindow
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
hi VertSplit guibg=bg guifg=bg

" Turn backup off
set nobackup
set nowb
set noswapfile

" misc
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set showmatch
set scrolloff=10 " show lines above and below cursor (when possible)
set cmdheight=2
set lazyredraw
set autochdir
set hidden " allow auto-hiding of edited buffers
set laststatus=2

" auto wrap
" 如果您在插入模式下输入时的目标是在窗口边缘自动软换行文本（仅在视觉上）
" set textwidth=0
" set wrapmargin=0
" set wrap
" set linebreak # (optional - breaks by word rather than character)
" 如果您在输入插入模式时的目标是在 80 列处自动硬换行文本（通过在实际文本文件中插入新行）
set textwidth=80
set wrapmargin=0
set formatoptions+=t
set linebreak " (optional - breaks by word rather than character)
" 如果您的目标是在插入模式下键入时自动软换行 80 列文本（仅在视觉上）
" set textwidth=0
" set wrapmargin=0
" set wrap
" set linebreak # (optional - breaks by word rather than character)
" set columns=80 # <<< THIS IS THE IMPORTANT PART

" --------------------
"  map
" --------------------

"let mapleader = ";"
"nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :terminal<CR>



" --------------------
" Plugin configuration
" --------------------

" NERDTree
" ----------
nnoremap <Leader>n :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Syntastic
" -----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprevious<CR>

let g:syntastic_c_checkers = ['gcc']
" let g:syntastic_c_gcc_args = "--ansi -Wall -g"
let g:syntastic_c_compiler_options = "--ansi -Wall -g"

" rust.vim
" -----------
let g:rustfmt_autosave = 1
