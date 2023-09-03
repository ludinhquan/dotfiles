vim.g.coc_global_extensions = {
 'coc-tsserver',
 'coc-lua',
 'coc-go',
 'coc-prisma',
 'coc-spell-checker',
 'coc-json',
 'coc-format-json',
 'coc-eslint',
 'coc-prettier',
 'coc-snippets',
 'coc-rust-analyzer'
}

vim.g.coc_snippet_next = '<tab>'

local keyset = vim.keymap.set

-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i", "<C-j>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Trigger completion
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })


-- Use K to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    -- jumpto documentation
    if vim.api.nvim_eval('coc#float#has_float()') == 1 then
      vim.api.nvim_command('wincmd w')
    else
      vim.fn.CocActionAsync('doHover')
    end
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

keyset("n", "[s", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]s", "<Plug>(coc-diagnostic-next)", { silent = true })
keyset("n", "[a", "<Plug>(coc-diagnostic-prev-error)", { silent = true })
keyset("n", "]a", "<Plug>(coc-diagnostic-next-error)", { silent = true })

keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

keyset("x", "fm", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "fm", "<Plug>(coc-format-selected)", { silent = true })

opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold"
})

-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
  group = "CocGroup",
  pattern = "typescript,json",
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
  group = "CocGroup",
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
  desc = "Update signature help on jump placeholder"
})
