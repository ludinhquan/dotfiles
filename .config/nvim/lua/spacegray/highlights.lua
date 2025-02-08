local highlights = {
	Normal = { fg = C.fg, bg = C.bg },
	SignColumn = { bg = C.bg },
	MsgArea = { fg = C.fg, bg = C.bg },
	ModeMsg = { fg = C.fg, bg = C.bg },
	MsgSeparator = { fg = C.fg, bg = C.bg },
	SpellBad = { fg = C.error_red, style = "underline" },
	SpellCap = { fg = C.yellow, style = "underline" },
	SpellLocal = { fg = C.green, style = "underline" },
	SpellRare = { fg = C.purple, style = "underline" },
	NormalNC = { fg = C.fg, bg = C.bg },
	Pmenu = { fg = C.light_gray, bg = C.popup_back },
	PmenuSel = { fg = C.alt_bg, bg = C.blue },
	WildMenu = { fg = C.alt_bg, bg = C.blue },
	CursorLineNr = { fg = C.light_gray, style = "bold" },
	Comment = { fg = C.gray, style = "italic" },
	Folded = { fg = C.accent, bg = C.alt_bg },
	FoldColumn = { fg = C.accent, bg = C.alt_bg },
	LineNr = { fg = C.fg, bg = C.bg },
	FloatBorder = { fg = C.cyan, bg = C.alt_bg },
	Whitespace = { fg = C.bg },
	-- WinSeparator = { bg = C.light_blue },
	CursorLine = { bg = C.dark },
	CursorColumn = { bg = C.dark },
	ColorColumn = { bg = C.dark },
	NormalFloat = { bg = C.dark },
	Visual = { bg = C.ui_blue },
	VisualNOS = { bg = C.alt_bg },
	WarningMsg = { fg = C.error_red, bg = C.bg },
	DiffAdd = { fg = C.alt_bg, bg = C.sign_add },
	DiffChange = { fg = C.alt_bg, bg = C.sign_change, style = "underline" },
	DiffDelete = { fg = C.alt_bg, bg = C.sign_delete },
	QuickFixLine = { bg = C.accent },
	PmenuSbar = { bg = C.alt_bg },
	PmenuThumb = { bg = C.gray },
	MatchWord = { style = "underline" },
	MatchParen = { fg = C.hint_blue, bg = C.bg, style = "underline" },
	MatchWordCur = { style = "underline" },
	MatchParenCur = { style = "underline" },
	Cursor = { fg = C.cursor_fg, bg = C.cursor_bg },
	lCursor = { fg = C.cursor_fg, bg = C.cursor_bg },
	CursorIM = { fg = C.cursor_fg, bg = C.cursor_bg },
	TermCursor = { fg = C.cursor_fg, bg = C.cursor_bg },
	TermCursorNC = { fg = C.cursor_fg, bg = C.cursor_bg },
	Conceal = { fg = C.accent },
	Directory = { fg = C.blue },
	SpecialKey = { fg = C.blue, style = "bold" },
	Title = { fg = C.blue, style = "bold" },
	ErrorMsg = { fg = C.error_red, bg = C.bg, style = "bold" },
	Search = { fg = C.light_gray, bg = C.search_blue },
	IncSearch = { fg = C.light_gray, bg = C.search_blue },
	Substitute = { fg = C.light_gray, bg = C.search_orange },
	MoreMsg = { fg = C.orange },
	Question = { fg = C.orange },
	EndOfBuffer = { fg = C.bg },
	NonText = { fg = C.bg },
	Variable = { fg = C.light_blue },
	String = { fg = C.green },
	Character = { fg = C.light_green },
	Constant = { fg = C.blue },
	Number = { fg = C.red },
	Boolean = { fg = C.red },
	Float = { fg = C.red },
	Identifier = { fg = C.light_blue },
	Function = { fg = C.yellow },
	Operator = { fg = C.gray },
	Type = { fg = C.purple },
	StorageClass = { fg = C.purple },
	Structure = { fg = C.purple },
	Typedef = { fg = C.purple },
	Keyword = { fg = C.blue },
	Statement = { fg = C.blue },
	Conditional = { fg = C.blue },
	Repeat = { fg = C.blue },
	Label = { fg = C.blue },
	Exception = { fg = C.blue },
	Include = { fg = C.blue },
	PreProc = { fg = C.purple },
	Define = { fg = C.purple },
	Macro = { fg = C.purple },
	PreCondit = { fg = C.purple },
	Special = { fg = C.orange },
	SpecialChar = { fg = C.white },
	Tag = { fg = C.blue },
	Debug = { fg = C.red },
	Delimiter = { fg = C.gray },
	SpecialComment = { fg = C.gray },
	Underlined = { style = "underline" },
	Bold = { style = "bold" },
	Italic = { style = "italic" },
	Ignore = { fg = C.cyan, bg = C.bg, style = "bold" },
	Todo = { fg = C.red, bg = C.bg, style = "bold" },
	Error = { fg = C.error_red, bg = C.bg, style = "bold" },
	TabLine = { fg = C.light_gray, bg = C.alt_bg },
	TabLineSel = { fg = C.white, bg = C.alt_bg },
	TabLineFill = { fg = C.white, bg = C.alt_bg },
	CocUnusedHighlight = { fg = "orange" },
	NotifyBackground = { bg = C.alt_bg },
}

return highlights
