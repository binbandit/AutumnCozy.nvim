-- Plugin highlights for AutumnCozy

local M = {}

function M.setup(hl, colors, conf)
  local plugins = conf.plugins
  
  -- Diff
  hl("DiffAdd", { fg = colors.yellow, bg = colors.bg_highlight })
  hl("DiffChange", { fg = colors.beige, bg = colors.bg_highlight })
  hl("DiffDelete", { fg = colors.red, bg = colors.bg_highlight })
  hl("DiffText", { fg = colors.fg, bg = colors.blue_light })
  hl("Added", { fg = colors.yellow })
  hl("Changed", { fg = colors.beige })
  hl("Removed", { fg = colors.red })
  
  -- Search & Visual
  hl("Search", { fg = colors.bg, bg = colors.yellow_bright })
  hl("CurSearch", { fg = colors.bg, bg = colors.red_dark, bold = true })
  hl("IncSearch", { fg = colors.bg, bg = colors.red })
  hl("Substitute", { fg = colors.bg, bg = colors.yellow })
  hl("Visual", { bg = colors.bg_alt })
  hl("VisualNOS", { bg = colors.bg_alt })
  hl("QuickFixLine", { bg = colors.bg_highlight })
  hl("MatchParen", { fg = colors.yellow, bold = true, underline = true })
  
  -- Folds
  hl("Folded", { fg = colors.beige_dark, bg = colors.bg_alt, italic = true })
  hl("FoldColumn", { fg = colors.beige_dark, bg = conf.transparent and nil or colors.bg })
  
  -- Telescope
  if plugins.all or plugins.telescope then
    hl("TelescopeNormal", { fg = colors.fg, bg = colors.bg_alt })
    hl("TelescopeBorder", { fg = colors.beige, bg = colors.bg_alt })
    hl("TelescopePromptBorder", { fg = colors.yellow, bg = colors.bg_alt })
    hl("TelescopeResultsBorder", { fg = colors.beige, bg = colors.bg_alt })
    hl("TelescopePreviewBorder", { fg = colors.beige, bg = colors.bg_alt })
    hl("TelescopeSelection", { fg = colors.yellow, bg = colors.bg_highlight, bold = true })
    hl("TelescopeSelectionCaret", { fg = colors.red })
    hl("TelescopeMultiSelection", { fg = colors.blue_light })
    hl("TelescopeMatching", { fg = colors.red, bold = true })
  end
  
  -- NvimTree
  if plugins.all or plugins.nvim_tree then
    hl("NvimTreeNormal", { fg = colors.fg, bg = colors.bg_alt })
    hl("NvimTreeFolderIcon", { fg = colors.blue_light })
    hl("NvimTreeFolderName", { fg = colors.fg })
    hl("NvimTreeOpenedFolderName", { fg = colors.yellow, bold = true })
    hl("NvimTreeFileDirty", { fg = colors.red })
    hl("NvimTreeExecFile", { fg = colors.yellow })
    hl("NvimTreeGitDirty", { fg = colors.red })
    hl("NvimTreeGitNew", { fg = colors.yellow })
    hl("NvimTreeGitDeleted", { fg = colors.red_dim })
    hl("NvimTreeIndentMarker", { fg = colors.beige_dark })
    hl("NvimTreeRootFolder", { fg = colors.red, bold = true })
  end
  
  -- Neo-tree
  if plugins.all or plugins.neo_tree then
    hl("NeoTreeNormal", { fg = colors.fg, bg = colors.bg_alt })
    hl("NeoTreeNormalNC", { fg = colors.fg_dim, bg = colors.bg_alt })
    hl("NeoTreeDirectoryIcon", { fg = colors.blue_light })
    hl("NeoTreeDirectoryName", { fg = colors.fg })
    hl("NeoTreeFileName", { fg = colors.fg_dim })
    hl("NeoTreeFileNameOpened", { fg = colors.yellow, bold = true })
    hl("NeoTreeRootName", { fg = colors.red, bold = true })
    hl("NeoTreeSymbolicLinkTarget", { fg = colors.yellow_dim })
    hl("NeoTreeGitAdded", { fg = colors.yellow })
    hl("NeoTreeGitDeleted", { fg = colors.red })
    hl("NeoTreeGitModified", { fg = colors.beige })
    hl("NeoTreeGitConflict", { fg = colors.red_dim })
    hl("NeoTreeGitUntracked", { fg = colors.fg_dim })
    hl("NeoTreeIndentMarker", { fg = colors.beige_dark })
    hl("NeoTreeExpander", { fg = colors.beige_dark })
    hl("NeoTreeTitleBar", { fg = colors.fg, bg = colors.blue_light })
    hl("NeoTreeFloatBorder", { fg = colors.beige, bg = colors.bg_alt })
    hl("NeoTreeFloatTitle", { fg = colors.yellow, bg = colors.bg_alt })
    hl("NeoTreeCursorLine", { bg = colors.bg_highlight })
    hl("NeoTreeDimText", { fg = colors.beige_dark })
    hl("NeoTreeMessage", { fg = colors.fg_dim, italic = true })
  end
  
  -- WhichKey
  if plugins.all or plugins.which_key then
    hl("WhichKey", { fg = colors.fg })
    hl("WhichKeyGroup", { fg = colors.blue_light })
    hl("WhichKeySeparator", { fg = colors.beige_dark })
    hl("WhichKeyDesc", { fg = colors.yellow })
    hl("WhichKeyFloat", { bg = colors.bg_alt })
  end
  
  -- GitSigns
  if plugins.all or plugins.gitsigns then
    hl("GitSignsAdd", { fg = colors.yellow })
    hl("GitSignsChange", { fg = colors.beige })
    hl("GitSignsDelete", { fg = colors.red })
    hl("GitSignsCurrentLineBlame", { fg = colors.beige_dark, italic = true })
  end
  
  -- IndentBlankline
  hl("IndentBlanklineChar", { fg = colors.beige_dark, nocombine = true })
  hl("IndentBlanklineContextChar", { fg = colors.yellow, nocombine = true })
  hl("IndentBlanklineContextStart", { sp = colors.yellow, underline = true })
  
  -- Notify
  if plugins.all or plugins.notify then
    hl("NotifyERRORBorder", { fg = colors.red })
    hl("NotifyWARNBorder", { fg = colors.yellow })
    hl("NotifyINFOBorder", { fg = colors.beige })
    hl("NotifyDEBUGBorder", { fg = colors.fg_dim })
    hl("NotifyTRACEBorder", { fg = colors.blue_light })
    hl("NotifyERRORTitle", { fg = colors.red })
    hl("NotifyWARNTitle", { fg = colors.yellow })
    hl("NotifyINFOTitle", { fg = colors.beige })
    hl("NotifyDEBUGTitle", { fg = colors.fg_dim })
    hl("NotifyTRACETitle", { fg = colors.blue_light })
  end
  
  -- CMP
  if plugins.all or plugins.cmp then
    hl("CmpItemAbbr", { fg = colors.fg_dim })
    hl("CmpItemAbbrDeprecated", { fg = colors.beige_dark, strikethrough = true })
    hl("CmpItemAbbrMatch", { fg = colors.yellow, bold = true })
    hl("CmpItemAbbrMatchFuzzy", { fg = colors.yellow_dim })
    hl("CmpItemKind", { fg = colors.blue_light })
    hl("CmpItemKindClass", { fg = colors.blue_light })
    hl("CmpItemKindConstant", { fg = colors.yellow })
    hl("CmpItemKindConstructor", { fg = colors.fg })
    hl("CmpItemKindEnum", { fg = colors.blue_light })
    hl("CmpItemKindEnumMember", { fg = colors.beige })
    hl("CmpItemKindEvent", { fg = colors.red })
    hl("CmpItemKindField", { fg = colors.fg_dim })
    hl("CmpItemKindFile", { fg = colors.beige_dark })
    hl("CmpItemKindFolder", { fg = colors.beige_dark })
    hl("CmpItemKindFunction", { fg = colors.fg })
    hl("CmpItemKindInterface", { fg = colors.blue_light })
    hl("CmpItemKindKeyword", { fg = colors.red })
    hl("CmpItemKindMethod", { fg = colors.fg })
    hl("CmpItemKindModule", { fg = colors.blue_light })
    hl("CmpItemKindOperator", { fg = colors.red_dim })
    hl("CmpItemKindProperty", { fg = colors.fg_dim })
    hl("CmpItemKindReference", { fg = colors.beige })
    hl("CmpItemKindSnippet", { fg = colors.yellow_dim })
    hl("CmpItemKindStruct", { fg = colors.blue_light })
    hl("CmpItemKindText", { fg = colors.fg_dim })
    hl("CmpItemKindTypeParameter", { fg = colors.blue_light })
    hl("CmpItemKindUnit", { fg = colors.beige })
    hl("CmpItemKindValue", { fg = colors.yellow_dim })
    hl("CmpItemKindVariable", { fg = colors.fg_dim })
    hl("CmpItemMenu", { fg = colors.beige_dark })
    hl("CmpDocumentation", { fg = colors.fg, bg = colors.bg_alt })
    hl("CmpDocumentationBorder", { fg = colors.beige, bg = colors.bg_alt })
  end
  
  -- Lualine
  if plugins.all or plugins.lualine then
    hl("lualine_a_normal", { fg = colors.fg, bg = colors.blue_light, bold = true })
    hl("lualine_b_normal", { fg = colors.fg_dim, bg = colors.bg_alt })
    hl("lualine_c_normal", { fg = colors.fg, bg = conf.transparent and nil or colors.bg })
    hl("lualine_x_normal", { fg = colors.fg_dim, bg = conf.transparent and nil or colors.bg })
    hl("lualine_y_normal", { fg = colors.yellow, bg = colors.bg_alt })
    hl("lualine_z_normal", { fg = colors.red, bg = colors.blue_light })
    hl("lualine_a_insert", { fg = colors.yellow, bg = colors.bg_highlight, bold = true })
    hl("lualine_b_insert", { fg = colors.fg, bg = colors.bg_alt })
    hl("lualine_c_insert", { fg = colors.fg_dim, bg = conf.transparent and nil or colors.bg })
    hl("lualine_a_visual", { fg = colors.red, bg = colors.bg_highlight, bold = true })
    hl("lualine_b_visual", { fg = colors.fg, bg = colors.bg_alt })
    hl("lualine_c_visual", { fg = colors.fg_dim, bg = conf.transparent and nil or colors.bg })
    hl("lualine_a_command", { fg = colors.blue_light, bg = colors.bg_highlight, bold = true })
    hl("lualine_b_command", { fg = colors.fg, bg = colors.bg_alt })
    hl("lualine_c_command", { fg = colors.fg_dim, bg = conf.transparent and nil or colors.bg })
    hl("lualine_a_inactive", { fg = colors.beige_dark, bg = colors.bg_alt })
    hl("lualine_b_inactive", { fg = colors.beige_dark, bg = conf.transparent and nil or colors.bg })
    hl("lualine_c_inactive", { fg = colors.beige_dark, bg = conf.transparent and nil or colors.bg })
  end
  
  -- Bufferline
  if plugins.all or plugins.bufferline then
    hl("BufferLineBackground", { fg = colors.fg_dim, bg = colors.bg_alt })
    hl("BufferLineBufferVisible", { fg = colors.fg, bg = colors.bg_highlight })
    hl("BufferLineBufferSelected", { fg = colors.fg, bg = colors.blue_light, bold = true })
    hl("BufferLineTab", { fg = colors.fg_dim, bg = colors.bg_alt })
    hl("BufferLineTabSelected", { fg = colors.yellow, bg = colors.blue_light })
    hl("BufferLineTabClose", { fg = colors.red, bg = colors.bg_alt })
    hl("BufferLineIndicatorSelected", { fg = colors.yellow })
    hl("BufferLineCloseButton", { fg = colors.red_dim, bg = colors.bg_alt })
    hl("BufferLineCloseButtonVisible", { fg = colors.red, bg = colors.bg_highlight })
    hl("BufferLineCloseButtonSelected", { fg = colors.red, bg = colors.blue_light })
    hl("BufferLineModified", { fg = colors.yellow_dim, bg = colors.bg_alt })
    hl("BufferLineModifiedVisible", { fg = colors.yellow, bg = colors.bg_highlight })
    hl("BufferLineModifiedSelected", { fg = colors.yellow, bg = colors.blue_light })
    hl("BufferLineSeparator", { fg = colors.beige_dark, bg = colors.bg_alt })
    hl("BufferLineSeparatorVisible", { fg = colors.beige_dark, bg = colors.bg_highlight })
    hl("BufferLineSeparatorSelected", { fg = colors.beige_dark, bg = colors.blue_light })
    hl("BufferLineFill", { bg = conf.transparent and nil or colors.bg })
    hl("BufferLineError", { fg = colors.red, bg = colors.bg_alt })
    hl("BufferLineWarning", { fg = colors.yellow, bg = colors.bg_alt })
    hl("BufferLineInfo", { fg = colors.beige, bg = colors.bg_alt })
  end
  
  -- All other plugins...
  M.setup_extended_plugins(hl, colors, conf)
end

-- Extended plugins (split for readability)
function M.setup_extended_plugins(hl, colors, conf)
  local plugins = conf.plugins
  
  -- Noice
  hl("NoiceCmdline", { fg = colors.fg, bg = colors.bg_alt })
  hl("NoiceCmdlineIcon", { fg = colors.yellow })
  hl("NoiceCmdlineIconSearch", { fg = colors.red })
  hl("NoiceCmdlinePopup", { fg = colors.fg, bg = colors.bg_alt })
  hl("NoiceCmdlinePopupBorder", { fg = colors.beige, bg = colors.bg_alt })
  hl("NoiceCmdlinePopupTitle", { fg = colors.yellow, bold = true })
  hl("NoiceConfirm", { fg = colors.fg, bg = colors.bg_alt })
  hl("NoiceConfirmBorder", { fg = colors.beige, bg = colors.bg_alt })
  hl("NoiceCursor", { fg = colors.bg, bg = colors.yellow })
  hl("NoiceFormatConfirm", { fg = colors.red })
  hl("NoiceFormatDate", { fg = colors.beige_dark })
  hl("NoiceFormatEvent", { fg = colors.blue_light })
  hl("NoiceFormatKind", { fg = colors.yellow_dim })
  hl("NoiceFormatLevelDebug", { fg = colors.fg_dim })
  hl("NoiceFormatLevelError", { fg = colors.red })
  hl("NoiceFormatLevelInfo", { fg = colors.beige })
  hl("NoiceFormatLevelOff", { fg = colors.beige_dark })
  hl("NoiceFormatLevelTrace", { fg = colors.blue_light })
  hl("NoiceFormatLevelWarn", { fg = colors.yellow })
  hl("NoiceFormatProgressDone", { fg = colors.yellow, bg = colors.bg_highlight })
  hl("NoiceFormatProgressTodo", { fg = colors.fg_dim, bg = colors.bg_highlight })
  hl("NoiceFormatTitle", { fg = colors.red, bold = true })
  hl("NoiceLspProgressClient", { fg = colors.blue_light })
  hl("NoiceLspProgressSpinner", { fg = colors.yellow_dim })
  hl("NoiceLspProgressTitle", { fg = colors.fg })
  hl("NoiceMini", { fg = colors.fg_dim, bg = colors.bg_alt })
  hl("NoicePopup", { fg = colors.fg, bg = colors.bg_alt })
  hl("NoicePopupBorder", { fg = colors.beige, bg = colors.bg_alt })
  hl("NoiceScrollbar", { bg = colors.bg_highlight })
  hl("NoiceScrollbarThumb", { bg = colors.beige })
  hl("NoiceSplit", { fg = colors.fg, bg = colors.bg_alt })
  hl("NoiceSplitBorder", { fg = colors.beige, bg = colors.bg_alt })
  hl("NoiceVirtualText", { fg = colors.beige_dark })
  
  -- Trouble
  hl("TroubleNormal", { fg = colors.fg, bg = colors.bg_alt })
  hl("TroubleText", { fg = colors.fg_dim })
  hl("TroubleCount", { fg = colors.yellow, bg = colors.bg_highlight })
  hl("TroubleFoldIcon", { fg = colors.beige_dark })
  hl("TroubleIndent", { fg = colors.beige_dark })
  hl("TroubleIconDirectory", { fg = colors.blue_light })
  hl("TroubleIconFile", { fg = colors.beige })
  hl("TroubleFile", { fg = colors.fg })
  hl("TroubleLocation", { fg = colors.red_dim })
  hl("TroublePreview", { fg = colors.yellow, bold = true })
  hl("TroubleSource", { fg = colors.blue_light })
  hl("TroubleCode", { fg = colors.red })
  hl("TroubleInformation", { fg = colors.beige })
  hl("TroubleWarning", { fg = colors.yellow })
  hl("TroubleError", { fg = colors.red })
  hl("TroubleHint", { fg = colors.fg_dim })
  hl("TroubleSignInformation", { fg = colors.beige })
  hl("TroubleSignWarning", { fg = colors.yellow })
  hl("TroubleSignError", { fg = colors.red })
  hl("TroubleSignHint", { fg = colors.fg_dim })
  hl("TroubleSignOther", { fg = colors.blue_light })
  

return M