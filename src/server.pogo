app = require './app'
db = require './db'
sockets = require './sockets'

connect = require 'express/node_modules/connect'
cookie = require 'express/node_modules/cookie'
parse cookie = connect.utils.parseSignedCookie

port = process.env.PORT || 3000

server = require('http').Server(app)
io = require('socket.io').listen(server)

Session = connect.middleware.session.Session

io.configure
    io.set 'authorization' @(data, accept)
        if (data.headers.cookie)
            data.cookie = cookie.parse(data.headers.cookie)
            data.sessionID = parse cookie(data.cookie.'connect.sid', app.secret)
            data.sessionStore = app.session store
            app.session store.get (data.sessionID) @(err, session)
                if (err || !session)
                    accept('Error', false)
                else
                    data.session = @new Session(data, session)
                    accept(null, true)
        else
            return accept('No cookie transmitted', false)
        
        accept(null, true)

io.sockets.on 'connection' @(socket)
    sockets.connect(socket, app)

db.connect!

server.listen (port)

console.log "Server running at http://127.0.0.1:#(port)"