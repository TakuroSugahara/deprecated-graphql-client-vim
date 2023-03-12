local M = {}

local api = vim.api
local ouput_buffer_name = "ouput.json"

local async = require 'plenary.async'
local uv = async.uv

local function read_file(path)
  local err, fd = uv.fs_open(path, "r", 438)
  assert(not err, err)
  if err then
    -- return 'open: ' .. err or 'no err'
    return err, fd
  end

  local err, stat = uv.fs_fstat(fd)
  if err then
    return 'fstat: ' .. err
  end

  local err, data = uv.fs_read(fd, stat.size, 0)
  if err then
    return 'read: ' .. err
  end

  local err = uv.fs_close(fd)
  if err then
    return 'close: ' .. err
  end

  return nil, data
end
-- local m = require('hello-beautiful-world-vim/module')

function M.edit_http_header()
  api.nvim_out_write('Edit config file.\n')
  api.nvim_command('setlocal buftype=nofile header.json')
end

function M.open_output()
  api.nvim_command("botright vnew " .. ouput_buffer_name)

  -- local buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(0, 'buftype', 'nofile') -- 書き込み禁止
  -- api.nvim_buf_set_option(0, 'modifiable', false) -- 書き込み禁止
  api.nvim_buf_set_option(0, 'swapfile', false) -- swrapfile作成しない
  api.nvim_buf_set_option(0, 'bufhidden', 'wipe') -- bufferを非表示にしたら削除する
end

function M.execute_request()
  -- local resp = vim.fn.systemlist(curl)
  -- table.insert(new_lines, "count: " .. count)

  -- api.nvim_buf_set_lines(0, 0, -1, false, new_lines)

  -- local data = read_file('~/work/graphql-client-vim/lua/graphql-client-vim/test/request.graphql')
  local err, data
  async.run(function()
    -- err, data = read_file('../graphql-client-vim/test/request.graphql')
    err, data = read_file('~/.zshrc')
    if err then
      print(err)
    end
  end)
  api.nvim_out_write('やぁ \n')
  api.nvim_out_write(data or "nilだった" .. '\n')
end

-- -- plugin内のmoduleの関数を実行するパターン
-- function M.hello_submodule()
--   vim.api.nvim_out_write(m.subModule())
-- end

return M
