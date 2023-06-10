local ts = require("nvim-treesitter.ts_utils")
local langs = require("nvim-paredit.lang")

local M = {}

function M.moveToNextElement()
  local lang = langs.getLanguageApi()
  local current_node = lang.getNodeRoot(ts.get_node_at_cursor())

  local sibling = current_node:next_named_sibling()
  if not sibling then
    return
  end

  local pos = { sibling:end_() }
  vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] - 1 })
end

function M.moveToPrevElement()
  local lang = langs.getLanguageApi()
  local current_node = lang.getNodeRoot(ts.get_node_at_cursor())

  local sibling = current_node:prev_named_sibling()
  if not sibling then
    return
  end

  local pos = { sibling:start() }
  vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
end

return M
