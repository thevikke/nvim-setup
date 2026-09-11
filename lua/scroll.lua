local M = {}

function M.line_above_center()
  local h = vim.api.nvim_win_get_height(0)
  local lnum = vim.fn.line(".")
  local from_top = math.floor(h * 0.25)
  vim.fn.winrestview({
    lnum = lnum,
    topline = math.max(1, lnum - from_top),
  })
end

return M
