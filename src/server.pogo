app = require './app'
db = require './db'
sockets = require './sockets'
socket auth = require './socket_auth'

port = process.env.PORT || 3000

server = require('http').Server(app)
io = require('socket.io').listen(server)

socket auth.apply to (io, app)

io.sockets.on 'connection' @(socket)
    sockets.connect(socket, app)

db.connect!

server.listen (port)

console.log "Server running at http://127.0.0.1:#(port)"