if exists("g:loaded_graphql_client_vim")
    finish
endif
let g:loaded_graphql_client_vim = 1

" Edit http header.json buffer
command! -nargs=0 EditHttpHeader lua require("graphql-client-vim").edit_http_header()
