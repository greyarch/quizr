Meteor.onConnection (conn) ->
  conn.httpHeaders['Access-Control-Allow-Origin'] = '*'
