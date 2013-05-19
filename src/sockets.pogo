Post = require './models/post'.Post
_ = require 'underscore'

users = []

exports.connect(socket) =
    
    if (socket.handshake.session)

        user = socket.handshake.session.passport.user

        users.push (user)
        socket.emit 'welcome' { room = users }
        socket.broadcast.emit 'connect' (user)
    
        socket.on 'post' @(data)
            post = @new Post {
                date = @new Date
                user = { name = user.name }
                text = data.text
            }
            post.save!
            socket.emit 'post' (post)
            socket.broadcast.emit 'post' (post)
        
        socket.on 'disconnect'
            users := _.without(users, user)
            socket.broadcast.emit 'disconnect' (user)
