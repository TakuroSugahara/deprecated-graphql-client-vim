local M = {}

local api = vim.api
local ouput_buffer_name = "ouput.json"
-- local m = require('hello-beautiful-world-vim/module')

function M.edit_http_header()
  api.nvim_out_write('Edit config file.\n')
  api.nvim_command('setlocal buftype=nofile header.json')
end

function M.open_output()
  api.nvim_out_write("Open " .. ouput_buffer_name .. ".\n")

  api.nvim_command("botright vnew " .. ouput_buffer_name)

  -- local buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(0, 'buftype', 'nofile') -- 書き込み禁止
  api.nvim_buf_set_option(0, 'modifiable', false) -- 書き込み禁止
  api.nvim_buf_set_option(0, 'swapfile', false) -- swrapfile作成しない
  api.nvim_buf_set_option(0, 'bufhidden', 'wipe') -- bufferを非表示にしたら削除する
end

-- local count = 0
-- function M.execute_request()
--   api.nvim_out_write("Execute graphql request")
--   api.nvim_buf_set_lines(ouput_buffer_name, 0, 1, false, {"hoge: " .. count, "piyo"})
-- end

-- -- plugin内のmoduleの関数を実行するパターン
-- function M.hello_submodule()
--   vim.api.nvim_out_write(m.subModule())
-- end

return M
