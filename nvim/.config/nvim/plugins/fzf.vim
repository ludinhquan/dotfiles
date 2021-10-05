" FZF
let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.8,
      \ 'highlight': 'Comment',
      \ 'rounded': v:false } }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   {'options': '--delimiter : --nth 4..'}, <bang>0)

nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>s :BLines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 
