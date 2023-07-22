lua <<EOF
  local status_ok, nvim_comment = pcall(require, "nvim_comment")
  if not status_ok then
    print "Failed to load nvim-comment"
    return
  end
  nvim_comment.setup()
EOF

nnoremap <Leader>/ :CommentToggle<Cr>
vnoremap <Leader>/ :CommentToggle<Cr>
