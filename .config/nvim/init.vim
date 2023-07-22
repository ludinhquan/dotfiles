source $XDG_CONFIG_HOME/nvim/plugin.vim

lua << EOF
  require"core.default-config"  
  require"core.mappings"  
  require"core.autocmds"  
EOF
 
for f in split(glob($XDG_CONFIG_HOME. '/nvim/plugins/*.vim'), '\n')
  exe 'source' f
endfor

