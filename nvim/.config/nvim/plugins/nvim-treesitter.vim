lua << EOF
  local treesitter_config = {
    ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {},
    matchup = {
      enable = false, -- mandatory, false will disable the whole extension
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      additional_vim_regex_highlighting = true,
      disable = { "latex" },
    },
    context_commentstring = {
      enable = false,
      config = { css = "// %s" },
    },
    indent = { enable = true, disable = { "yaml" } },
    autotag = { enable = false },
    textobjects = {
      swap = {
        enable = false,
      },
      select = {
        enable = false,
      },
    },
    textsubjects = {
      enable = false,
      keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
    },
    playground = {
      enable = false,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    rainbow = {
      enable = false,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    },
  }


  local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")

  if not status_ok then
    print "failed to load nvim-treesitter.configs"
    return
  end

  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
  parser_configs.http = {
    install_info = {
      url = "https://github.com/NTBBloodbath/tree-sitter-http",
      files = { "src/parser.c" },
      branch = "main",
    },
  }
  treesitter_configs.setup(treesitter_config)
EOF
