-- キャッシュされたモジュール削除
package.loaded['graphql-client-vim'] = nil

local graphql_client = require('graphql-client-vim')

graphql_client.execute_request()
