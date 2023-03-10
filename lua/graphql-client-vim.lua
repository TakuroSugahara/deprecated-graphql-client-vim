local M = {}

-- local m = require('hello-beautiful-world-vim/module')

function M.edit_http_header()
  vim.api.nvim_out_write('Edit http header!\n')
end

-- -- plugin内のmoduleの関数を実行するパターン
-- function M.hello_submodule()
--   vim.api.nvim_out_write(m.subModule())
-- end

return M
