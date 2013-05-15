exports.connect(socket) =

    socket.on 'send:message' @(data)
        socket.broadcast.emit 'send:message' { text = data.text }