" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
 endif

call plug#begin('~/.config/nvim/bundle')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-eslint'
  Plug 'neoclide/coc-prettier'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'APZelos/blamer.nvim'
  Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
  Plug 'kevinhwang91/rnvimr'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'simeji/winresizer'

  Plug 'karb94/neoscroll.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'phaazon/hop.nvim'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'terrortylor/nvim-comment'
  Plug 'glepnir/galaxyline.nvim'
  Plug 'romgrk/barbar.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ludinhquan/rest.nvim'
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua', {'commit': '84126d3e'}
call plug#end()
