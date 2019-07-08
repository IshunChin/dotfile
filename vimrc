" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""
" 基本設定
"""""""""""""""""""""
set encoding=utf-8 " エンコーディングの設定
set showmatch " 閉じカッコを入力すると、一瞬対応するカッコにカーソルが飛ぶ
set matchtime=1 " showmatchの時間を0.1秒にすiる
set nocompatible " vi互換を切る
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set backspace=2 " delete/backspaceキーが前回の変更を削除できるようにする
set clipboard=unnamed,autoselect " yankをクリップボードに反映する
set display=lastline " 行が長くても最後まで表示する
set autoread " 外部でファイルが書き換えられたら自動で読み直す
set noswapfile " スワップファイルを生成しない
set wildmenu " コマンドモードでTabキーによるファイル名を補完する
set wildmode=full " 候補のリストを表示
set hidden " 変更中のファイルでも、保存しないで他のファイルを表示
set cindent " C言語スタイルのインデントを自動で入れる
set pumheight=20 "　補完メニューの行数を指定,デフォルトは画面いっぱい
let mapleader=' ' "Leaderキーをspaceにする

"""""""""""""""""""""
" 見た目
"""""""""""""""""""""
syntax on 
" molokai のビジュアルモードが見辛いので色を変える
colorscheme molokai
autocmd colorscheme molokai highlight Visual ctermbg=8
let g:molokai_original = 1
let g:rehash256 = 1

set title " ウインドウのタイトルバーにファイルのパス情報等を表示する
set number " 行番号を表示する
set cursorline " カーソルの行を目立つ
set laststatus=2 " ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set ruler " ステータスバーニカーソルの位置表示を行う
set showcmd " ステータスバーの右下に 入力中のコマンドを表示する
" 行番号の色
highlight LineNr ctermfg=darkyellow
"　ステータスバーの見た目を変更
" highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"""""""""""""""""""""
" 検索
"""""""""""""""""""""
set incsearch " 検索ワードの最初の文字を入力した時点で検索を開始する
set smartcase " 小文字のみで検索したときに大文字小文字を無視する
set hlsearch " 検索結果をハイライト表示する
"""FZF""" 
nmap ; :Buffers
nmap t :Files
nmap r :Tags

"""ack.vim"""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""
" タブ&インデント
"""""""""""""""""""""
set expandtab " タブの代わりに空白文字を挿入する
set tabstop=4 " タブ文字の表示幅
set shiftwidth=4 " Vimが挿入するインデントの幅
set smarttab " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set shiftwidth=4 " cindentやautoindent時に挿入されるタブの幅
set smarttab "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

"""""""""""""""""""""
" キーマッピング
"""""""""""""""""""""
" 括弧自動補完
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
" 数字のインクリメント
nnoremap + <C-a> 
" 数字のデクリメント
nnoremap - <C-x> 
" 行末までヤング
nnoremap Y y$

"""""""""""""""""""""
" ALE
"""""""""""""""""""""
" ステータスカラムを常に表示
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

"""""""""""""""""""""
" NERDTree
"""""""""""""""""""""
map <Leader>n :NERDTreeToggle<CR>

"""""""""""""""""""""
" lightline
"""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

"""""""""""""""""""""
" lightline
"""""""""""""""""""""
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
