" ##################################################################
" vim-instant-markdown
" ##################################################################
" プレビューを手動で起動するように
let g:instant_markdown_autostart = 0
autocmd FileType markdown nnoremap <Leader>o :<C-u>InstantMarkdownPreview<CR>

