if exists("g:loaded_graphql_client_vim")
    finish
endif
let g:loaded_graphql_client_vim = 1

" Edit http header.json file
command! -nargs=0 GraphqlClientEditConfig lua require("graphql-client-vim").edit_http_header()

" Open output.json buffer
command! -nargs=0 GraphqlClientOpenOutput lua require("graphql-client-vim").open_output()

" Execute graphql request
command! -nargs=0 GraphqlClientExecute lua require("graphql-client-vim").execute_request()

" EchoをOutput.jsonを吐き出す
" Graphqlのリクエストを送る
" レスポンスをoutput.jsonに吐き出す
" 実行コマンドでリクエストを呼び出す
" .graphqlのファイルを編集
" 編集した.graphqlのデータをリクエストとして吐き出す
" Header, Configのファイルを編集
" Header, Endpoint情報をリクエストに付ける
" GraphqlClientEditで必要なeditorを全て表示する
" 現在のwindowをGraphql Editorに乗り換える

" variableの情報をbuffer書き込めるようにする
" variableの情報をリクエストに付与する

