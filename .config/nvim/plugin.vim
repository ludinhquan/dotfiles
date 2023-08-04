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

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua', 
  Plug 'simeji/winresizer'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'romgrk/barbar.nvim'
  Plug 'terrortylor/nvim-comment'
  Plug 'nvim-treesitter/nvim-treesitter'

  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'APZelos/blamer.nvim'
  Plug 'tpope/vim-surround'
  Plug 'windwp/nvim-autopairs'
  Plug 'karb94/neoscroll.nvim'
  Plug 'phaazon/hop.nvim'

  Plug 'glepnir/dashboard-nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'rest-nvim/rest.nvim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'nvimdev/template.nvim'

  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'

  " Plug 'pantharshit00/vim-prisma'
  " Plug 'dstein64/vim-startuptime'
call plug#end()
