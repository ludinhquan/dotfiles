-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  scroll_preview = { scroll_down = "<C-j>", scroll_up = "<C-k>" },
  definition = {
    keys = {
      vsplit = "i",
      quit = "q",
    },
  },
  imp = {
    keys = {
      vsplit = "i",
      quit = "q",
    },
  },
  finder = {
    keys = {
      vsplit = "i",
      quit = "q",
    },
  },
  rename = {
    in_select = false,
    keys = {
      quit = "q",
    },
  },
})
