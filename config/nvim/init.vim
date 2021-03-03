" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Theme 
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'nanotech/jellybeans.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'

" common
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'

" 様々な言語のシンタックスやインデントを提供するプラグインです。
Plug 'sheerun/vim-polyglot'

" language
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'hashivim/vim-terraform', {'for': 'terraform'}

" Initialize plugin system
call plug#end()

set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set updatetime=100
set mouse=a            "マウス操作を可能にする
set linebreak          "単語の途中で折り返ししない
set signcolumn=yes     "
set shortmess+=c       "
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained, BufEnter * checktime

" 探査必要ためのリートタイムをなくすため、各種プロバイダーを明記する
let g:node_host_prog = $HOME . '/.nvm/versions/node/v12.16.1/bin/neovim-node-host'
let g:ruby_host_prog = $HOME . '/.rbenv/versions/2.6.3/bin/neovim-ruby-host'
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" ハイライト設定
hi Search ctermbg=DarkGray

" Leaderキー
let g:mapleader=" "

" escキーでターミナルのノーマルモードに切り替え
tnoremap <Esc> <C-\><C-n>

" ターミナルのショートカット
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize

" .vimrcのリロード
nnoremap <leader>s :source $HOME/.config/nvim/init.vim<CR>

" netrwの設定
" let g:netrw_liststyle = 3
" nnoremap <leader>t :<C-u>Ve<CR>

" jjでノーマルモードへ
inoremap <silent> jj <ESC>

" sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number             "行番号を表示
" set relativenumber       "相対的行番号を表示

" Set 7 lines to the cursor - when moving vertically useing j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

set cmdheight=2        "コマンドラインの情報を多く確認できるように

set hlsearch                "検索した文字をハイライトする

set lazyredraw

set magic

set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

" colorscheme
set background=dark
colorscheme Tomorrow-Night-Bright

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc.
set nobackup
set nowb
set noswapfile

set undofile           "undofileの作成を許可する
set nowritebackup      "上書き時のバックアップを作成しない

" 重複率を軽減するために//を設定してあける
" ディレクトリは事前に用意する必要がある
set undodir=~/.nvim/undo//
set backupdir=~/.nvim/backup//
set directory=~/.nvim/swp//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set splitright         "画面を縦分割する際に右に開く


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Loadding other vim files(Ex plugins setting, helper)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor
