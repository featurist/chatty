app = require './app'
sockets = require './sockets'

port = process.env.PORT || 3000

server = require('http').Server(app)
io = require('socket.io').listen(server)
io.sockets.on 'connection' @(socket)
    sockets.connect(socket)

server.listen (port)

console.log "Server running at http://127.0.0.1:#(port)"