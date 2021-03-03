let g:coc_global_extensions=[
  \ "coc-css",
  \ "coc-eslint",
  \ "coc-html",
  \ "coc-json",
  \ "coc-snippets",
  \ "coc-tsserver",
  \ "coc-vimlsp",
  \ "coc-highlight",
  \ "coc-ember",
  \ "coc-python",
  \ ]

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>fa  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>fe  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>fc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>fo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>fs  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent> <space>fp  :<C-u>CocListResume<CR>

" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" ファイル探査
nnoremap <silent> <space>ff :<c-u>CocList files<CR>
" CurrenDictory内でグレープ検査
nnoremap <silent> <space>fg :<c-u>CocList grep<CR>
" 開いているファイル内で単語探査
nnoremap <silent> <space>lw :<c-u>CocList words<CR>

" VIMセッションの保存と読み込み
nnoremap <space>fs :<c-u>CocCommand session.save<CR>
nnoremap <space>fl :<c-u>CocCommand session.load<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
