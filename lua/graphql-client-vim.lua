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
  -- api.nvim_buf_set_option(0, 'modifiable', false) -- 書き込み禁止
  api.nvim_buf_set_option(0, 'swapfile', false) -- swrapfile作成しない
  api.nvim_buf_set_option(0, 'bufhidden', 'wipe') -- bufferを非表示にしたら削除する
  api.nvim_command("hidden")
end

local count = 0
function M.execute_request()
  api.nvim_out_write("Execute graphql request")

  local new_lines = {}
  table.insert(new_lines, "hoge")

  count = count + 1
  for i = 1, count do
    table.insert(new_lines, "piyo")
  end

  table.insert(new_lines, "count: " .. count)

  api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
end

-- -- plugin内のmoduleの関数を実行するパターン
-- function M.hello_submodule()
--   vim.api.nvim_out_write(m.subModule())
-- end

return M
