local function apply_custom_highlights()
  local c = {
    bg = "#111827",
    bg_dark = "#0E1420",
    bg_sidebar = "#111726",
    bg_float = "#0E1420",
    bg_cursorline = "#1F2937",
    bg_visual = "#374151",
    fg = "#F9FAFB",
    fg_dim = "#9CA3AF",
    fg_dark = "#6B7280",
    fg_gutter = "#4B5563",
    blue = "#BAE6FD",
    indigo = "#A5B4FC",
    violet = "#DDD6FE",
    green = "#B5E8B0",
    green_dim = "#98BC99",
    orange = "#FBC19D",
    red = "#FCA5A5",
    opal = "#99BBBD",
    gray = "#374151",
    comment = "#6B7280",
  }

  local hl = vim.api.nvim_set_hl

  -- Snacks picker (file finder)
  hl(0, "SnacksPickerDir", { fg = c.comment })
  hl(0, "SnacksPickerFile", { fg = c.fg })
  hl(0, "SnacksPickerDirectory", { fg = c.blue })
  hl(0, "SnacksPickerMatch", { fg = c.green, bold = true })
  hl(0, "SnacksPickerDimmed", { fg = c.fg_dim })
  hl(0, "SnacksPickerPathHidden", { fg = c.comment })
  hl(0, "SnacksPickerPathIgnored", { fg = c.comment })

  -- Neo-tree
  hl(0, "NeoTreeNormal", { fg = c.fg, bg = c.bg_sidebar })
  hl(0, "NeoTreeNormalNC", { fg = c.fg, bg = c.bg_sidebar })
  hl(0, "NeoTreeDirectoryName", { fg = c.blue })
  hl(0, "NeoTreeDirectoryIcon", { fg = c.blue })
  hl(0, "NeoTreeRootName", { fg = c.blue, bold = true })
  hl(0, "NeoTreeFileName", { fg = c.fg })
  hl(0, "NeoTreeFileIcon", { fg = c.fg_dim })
  hl(0, "NeoTreeFileNameOpened", { fg = c.violet })
  hl(0, "NeoTreeIndentMarker", { fg = c.fg_gutter })
  hl(0, "NeoTreeGitAdded", { fg = c.green })
  hl(0, "NeoTreeGitConflict", { fg = c.orange })
  hl(0, "NeoTreeGitDeleted", { fg = c.red })
  hl(0, "NeoTreeGitModified", { fg = c.orange })
  hl(0, "NeoTreeGitUntracked", { fg = c.green_dim })
  hl(0, "NeoTreeTitleBar", { fg = c.bg, bg = c.blue })
  hl(0, "NeoTreeFloatBorder", { fg = c.fg_gutter })
  hl(0, "NeoTreeWinSeparator", { fg = c.bg_sidebar, bg = c.bg_sidebar })
  hl(0, "NeoTreeCursorLine", { bg = c.bg_cursorline })
  hl(0, "NeoTreeDimText", { fg = c.comment })
  hl(0, "NeoTreeDotfile", { fg = c.comment })

  -- Bufferline
  hl(0, "BufferLineBackground", { fg = c.comment, bg = c.bg_dark })
  hl(0, "BufferLineFill", { bg = c.bg_dark })
  hl(0, "BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
  hl(0, "BufferLineBufferVisible", { fg = c.fg_dim, bg = c.bg })

  -- Which-key
  hl(0, "WhichKey", { fg = c.blue })
  hl(0, "WhichKeyGroup", { fg = c.indigo })
  hl(0, "WhichKeyDesc", { fg = c.fg_dim })
  hl(0, "WhichKeySeparator", { fg = c.comment })
  hl(0, "WhichKeyFloat", { bg = c.bg_float })

  -- Noice / notify
  hl(0, "NoiceCmdlinePopup", { bg = c.bg_float })
  hl(0, "NoiceCmdlinePopupBorder", { fg = c.fg_gutter })
  hl(0, "NoiceCmdlineIcon", { fg = c.blue })
  hl(0, "NotifyINFOBorder", { fg = c.indigo })
  hl(0, "NotifyINFOTitle", { fg = c.indigo })
  hl(0, "NotifyWARNBorder", { fg = c.orange })
  hl(0, "NotifyERRORBorder", { fg = c.red })

  -- Indent / dashboard / flash / lazy
  hl(0, "MiniIndentscopeSymbol", { fg = c.indigo, nocombine = true })
  hl(0, "IblIndent", { fg = c.gray, nocombine = true })
  hl(0, "IblScope", { fg = c.indigo, nocombine = true })
  hl(0, "FlashLabel", { fg = c.bg, bg = c.red, bold = true })
  hl(0, "LazyH1", { fg = c.bg, bg = c.blue, bold = true })
  hl(0, "LazyButton", { fg = c.fg, bg = c.bg_cursorline })
  hl(0, "LazyButtonActive", { fg = c.bg, bg = c.blue, bold = true })
  hl(0, "LazySpecial", { fg = c.indigo })
end

return {
  {
    "sam4llis/nvim-tundra",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-tundra").setup({
        plugins = {
          lsp = true,
          semantic_tokens = true,
          treesitter = true,
          telescope = true,
          cmp = true,
          context = true,
          gitsigns = true,
        },
      })
      vim.opt.background = "dark"

      -- Apply after colorscheme loads
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "tundra",
        callback = apply_custom_highlights,
      })

      -- Also apply on VimEnter as a fallback
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          if vim.g.colors_name == "tundra" then
            apply_custom_highlights()
          end
        end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tundra",
    },
  },
}
