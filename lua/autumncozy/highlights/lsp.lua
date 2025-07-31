-- LSP and Diagnostics highlights for AutumnCozy

local M = {}

function M.setup(hl, colors, conf)
  -- Diagnostics
  hl("DiagnosticError", { fg = colors.red })
  hl("DiagnosticWarn", { fg = colors.yellow })
  hl("DiagnosticInfo", { fg = colors.beige })
  hl("DiagnosticHint", { fg = colors.fg_dim })
  hl("DiagnosticVirtualTextError", { fg = colors.red_dim, bg = colors.bg_highlight })
  hl("DiagnosticVirtualTextWarn", { fg = colors.yellow_dim, bg = colors.bg_highlight })
  hl("DiagnosticVirtualTextInfo", { fg = colors.beige_dark, bg = colors.bg_highlight })
  hl("DiagnosticVirtualTextHint", { fg = colors.fg_dim, bg = colors.bg_highlight })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.beige })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.fg_dim })
  
  -- LSP References
  hl("LspReferenceText", { bg = colors.bg_highlight })
  hl("LspReferenceRead", { bg = colors.bg_highlight })
  hl("LspReferenceWrite", { bg = colors.bg_highlight, underline = true })
  
  -- LSP Signature
  hl("LspSignatureActiveParameter", { fg = colors.yellow, bold = true })
  
  -- LSP Floating windows
  hl("LspFloatWinNormal", { fg = colors.fg, bg = colors.bg_alt })
  hl("LspFloatWinBorder", { fg = colors.beige })
  
  -- LSP Saga
  hl("LspSagaHoverBorder", { fg = colors.beige })
  hl("LspSagaRenameBorder", { fg = colors.yellow })
  hl("LspSagaDefPreviewBorder", { fg = colors.blue_light })
  hl("LspSagaCodeActionBorder", { fg = colors.red })
  hl("LspSagaFinderSelection", { fg = colors.yellow })
  
  -- LSP Inlay hints
  hl("LspInlayHint", { fg = colors.beige_dark, italic = true })
  
  -- Semantic tokens (LSP)
  hl("@lsp.type.class", { link = "Type" })
  hl("@lsp.type.decorator", { link = "Function" })
  hl("@lsp.type.enum", { link = "Type" })
  hl("@lsp.type.enumMember", { link = "Constant" })
  hl("@lsp.type.function", { link = "Function" })
  hl("@lsp.type.interface", { link = "Type" })
  hl("@lsp.type.macro", { link = "Macro" })
  hl("@lsp.type.method", { link = "Function" })
  hl("@lsp.type.namespace", { link = "@namespace" })
  hl("@lsp.type.parameter", { link = "@parameter" })
  hl("@lsp.type.property", { link = "@property" })
  hl("@lsp.type.struct", { link = "Type" })
  hl("@lsp.type.type", { link = "Type" })
  hl("@lsp.type.variable", { link = "Variable" })
end

return M