" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Initialize plugin system
call plug#end()


"""""""""""""""""""""
" 基本設定
"""""""""""""""""""""
syntax on 
" molokai のビジュアルモードが見辛いので色を変える
colorscheme molokai
autocmd colorscheme molokai highlight Visual ctermbg=8
let g:molokai_original = 1
let g:rehash256 = 1

set title " ウインドウのタイトルバーにファイルのパス情報等を表示する
set number " 行番号を表示する
highlight LineNr ctermfg=darkyellow " 行番号の色
set cursorline " カーソルの行を目立つ
set showmatch " 閉じカッコを入力すると、一瞬対応するカッコにカーソルが飛ぶ
set matchtime=1 " showmatchの時間を0.1秒にすiる
set encoding=utf-8 " エンコーディングの設定
set nocompatible " vi互換を切る
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set backspace=2 " delete/backspaceキーが前回の変更を削除できるようにする
set clipboard=unnamed,autoselect " yankをクリップボードに反映する
set ruler " ステータスバーニカーソルの位置表示を行う。
set display=lastline " 行が長くても最後まで表示する
set pumheight=20 "　補完メニューの行数を指定。デフォルトは画面いっぱい。
set autoread " 外部でファイルが書き換えられたら自動で読み直す
set noswapfile " スワップファイルを生成しない
set showcmd " ステータスバーの右下に 入力中のコマンドを表示する
set wildmenu " コマンドモードでTabキーによるファイル名を補完する
set wildmode=full " 候補のリストを表示
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止まらないようにする
set hidden " 変更中のファイルでも、保存しないで他のファイルを表示
set laststatus=2 " ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
"　ステータスバーの見た目を変更
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white


"""""""""""""""""""""
" 検索
"""""""""""""""""""""
set incsearch " 検索ワードの最初の文字を入力した時点で検索を開始する
set smartcase " 小文字のみで検索したときに大文字小文字を無視する
set hlsearch " 検索結果をハイライト表示する

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
set smarttab "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。


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

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
