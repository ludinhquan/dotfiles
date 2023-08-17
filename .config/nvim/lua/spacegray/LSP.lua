local LSP = {
  LspDiagnosticsDefaultError = { fg = C.error_red },
  LspDiagnosticsDefaultWarning = { fg = C.warning_orange },
  LspDiagnosticsDefaultInformation = { fg = C.info_yellow },
  LspDiagnosticsDefaultHint = { fg = C.hint_blue },
  LspDiagnosticsVirtualTextError = { fg = C.error_red },
  LspDiagnosticsVirtualTextWarning = { fg = C.warning_orange },
  LspDiagnosticsVirtualTextInformation = { fg = C.info_yellow },
  LspDiagnosticsVirtualTextHint = { fg = C.hint_blue },
  LspDiagnosticsFloatingError = { fg = C.error_red },
  LspDiagnosticsFloatingWarning = { fg = C.warning_orange },
  LspDiagnosticsFloatingInformation = { fg = C.info_yellow },
  LspDiagnosticsFloatingHint = { fg = C.hint_blue },
  LspDiagnosticsSignError = { fg = C.error_red },
  LspDiagnosticsSignWarning = { fg = C.warning_orange },
  LspDiagnosticsSignInformation = { fg = C.info_yellow },
  LspDiagnosticsSignHint = { fg = C.hint_blue },
  LspDiagnosticsError = { fg = C.error_red },
  LspDiagnosticsWarning = { fg = C.warning_orange },
  LspDiagnosticsInformation = { fg = C.info_yellow },
  LspDiagnosticsHint = { fg = C.hint_blue },
  LspDiagnosticsUnderlineError = { style = "underline" },
  LspDiagnosticsUnderlineWarning = { style = "underline" },
  LspDiagnosticsUnderlineInformation = { style = "underline" },
  LspDiagnosticsUnderlineHint = { style = "underline" },
  QuickScopePrimary = { fg = C.purple_test, style = "underline" },
  QuickScopeSecondary = { fg = C.cyan_test, style = "underline" },
  TelescopeSelection = { fg = C.hint_blue },
  TelescopeMatching = { fg = C.info_yellow, style = "bold" },
  TelescopeBorder = { fg = C.cyan, bg = Config.transparent_background and "NONE" or C.bg },
  NvimTreeFolderIcon = { fg = C.blue },
  NvimTreeIndentMarker = { fg = C.gray },
  NvimTreeVertSplit = { fg = C.alt_bg, bg = C.alt_bg },
  NvimTreeFolderName = { fg = C.blue },
  NvimTreeOpenedFolderName = { fg = C.cyan, style = "italic" },
  NvimTreeImageFile = { fg = C.purple },
  NvimTreeSpecialFile = { fg = C.orange },
  NvimTreeGitStaged = { fg = C.sign_add },
  NvimTreeGitNew = { fg = C.sign_add },
  NvimTreeGitDirty = { fg = C.sign_add },
  NvimTreeGitDeleted = { fg = C.sign_delete },
  NvimTreeGitMerge = { fg = C.sign_change },
  NvimTreeGitRenamed = { fg = C.sign_change },
  NvimTreeSymlink = { fg = C.cyan },
  NvimTreeRootFolder = { fg = C.fg, style = "bold" },
  NvimTreeExecFile = { fg = C.green },
  LirFloatNormal = { fg = C.light_gray, bg = C.alt_bg },
  LirDir = { fg = C.blue },
  LirSymLink = { fg = C.cyan },
  LirEmptyDirText = { fg = C.blue },
  BufferCurrent = { fg = C.white, bg = C.sign_change },
  BufferCurrentIndex = { fg = C.fg, bg = C.bg },
  BufferCurrentMod = { fg = C.info_yellow, bg = C.bg },
  BufferCurrentSign = { fg = C.hint_blue, bg = C.bg },
  BufferCurrentTarget = { fg = C.red, bg = C.bg, style = "bold" },
  BufferVisible = { fg = C.fg, bg = C.bg },
  BufferVisibleIndex = { fg = C.fg, bg = C.bg },
  BufferVisibleMod = { fg = C.info_yellow, bg = C.bg },
  BufferVisibleSign = { fg = C.gray, bg = C.bg },
  BufferVisibleTarget = { fg = C.red, bg = C.bg, style = "bold" },
  BufferInactive = { fg = C.gray, bg = C.alt_bg },
  BufferInactiveIndex = { fg = C.gray, bg = C.alt_bg },
  BufferInactiveMod = { fg = C.info_yellow, bg = C.alt_bg },
  BufferInactiveSign = { fg = C.gray, bg = C.alt_bg },
  BufferInactiveTarget = { fg = C.red, bg = C.alt_bg, style = "bold" },
  StatusLine = { fg = C.alt_bg },
  StatusLineNC = { fg = C.alt_bg },
  StatusLineSeparator = { fg = C.alt_bg },
  StatusLineTerm = { fg = C.alt_bg },
  StatusLineTermNC = { fg = C.alt_bg },
  CodiVirtualText = { fg = C.hint_blue },
  IndentBlanklineContextChar = { fg = C.accent },
  DashboardHeader = { fg = C.blue },
  DashboardCenter = { fg = C.purple },
  DashboardFooter = { fg = C.cyan },
  xmlTag = { fg = C.cyan },
  xmlTagName = { fg = C.cyan },
  xmlEndTag = { fg = C.cyan },
  CompeDocumentation = { bg = C.alt_bg },
  DiffViewNormal = { fg = C.gray, bg = C.alt_bg },
  DiffviewStatusAdded = { fg = C.sign_add },
  DiffviewStatusModified = { fg = C.sign_change },
  DiffviewStatusRenamed = { fg = C.sign_change },
  DiffviewStatusDeleted = { fg = C.sign_delete },
  DiffviewFilePanelInsertion = { fg = C.sign_add },
  DiffviewFilePanelDeletion = { fg = C.sign_delete },
  DiffviewVertSplit = { bg = C.bg },
  diffAdded = { fg = C.sign_add },
  diffRemoved = { fg = C.sign_delete },
  diffFileId = { fg = C.blue, style = "bold,reverse" },
  diffFile = { fg = C.alt_bg },
  diffNewFile = { fg = C.green },
  diffOldFile = { fg = C.red },
  debugPc = { bg = C.cyan },
  debugBreakpoint = { fg = C.red, style = "reverse" },
}

return LSP
