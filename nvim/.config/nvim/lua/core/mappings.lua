vim.cmd([[
  let g:mapleader = "\<Space>"
  colorscheme spacegray

  nnoremap <F5> :colorscheme gruvbox<CR>
  nnoremap <F6> :colorscheme OceanicNext<CR>
  nnoremap <F7> :colorscheme nord<CR>

  nnoremap <C-s> :w<CR>
  inoremap <C-s> <ESC>:w<CR>li
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l

  " Easy CAPS
  inoremap <c-u> <ESC>viwUi
  inoremap <c-l> <ESC>viwui

  " Split window
  nnoremap <C-\> :vsplit<CR>
  xnoremap <C-\> :vsplit<CR>
  inoremap <C-\> <Esc>:vsplit<CR>

  " Source nvim
  nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>
  nnoremap rr :source %<CR>

  inoremap jk <ESC>
  inoremap kj <ESC>
  nnoremap <CR> A<CR>
  nnoremap <Leader>q :q<CR>

  nnoremap <ESC><ESC> :nohlsearch<CR>
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>

  " tabs
  nnoremap th :tabfirst<CR>
  nnoremap tk :tabnext<CR>
  nnoremap tj :tabprev<CR>
  nnoremap tl :tablast<CR>
  nnoremap tn :tabnew<CR>
  nnoremap te <C-w>T
  nnoremap <S-TAB> :tabp<CR>

  " move tab to first position
  nnoremap tF :tabm 0<CR>
  nnoremap tL :tabm<CR>

  " Remap scrolling
  nnoremap l w
  nnoremap h b
  nnoremap L l
  nnoremap H h
  vnoremap l w
  vnoremap h b
  vnoremap H h
  vnoremap L l

  " indent without killing the selection in VISUAL mode
  vmap < <gv
  vmap > >gv
  " Keep the cursor in place while joining lines
  nnoremap J mzJ`z
  inoremap <C-f> <Right>
  inoremap <C-b> <Left>
  inoremap <C-e> <C-o>$
  inoremap <C-a> <C-o>^
  inoremap <C-l> <Del>
  inoremap <C-h> <Backspace>

  " Move to last modification line 
  nnoremap <Leader>l '.

  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi SignColumn ctermbg=none guibg=none"
  hi NormalNC ctermbg=none guibg=none"
  hi MsgArea ctermbg=none guibg=none"
  hi TelescopeBorder ctermbg=none guibg=none"
  hi NvimTreeNormal ctermbg=none guibg=none"
  hi BufferCurrent gui=bold guibg=#265F78 guifg=#D8DEE9"
  hi BufferCurrentSign gui=bold guibg=#265F78 guifg=#D8DEE9"
  hi BufferCurrentMod gui=bold guibg=#265F78"
]])
