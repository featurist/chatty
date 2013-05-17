Post = require './models/post'.Post

exports.connect(socket) =

    socket.on 'post' @(data)
        user = socket.handshake.session.passport.user
        console.log(user)
        post = @new Post {
            date = @new Date
            user = { name = user.name }
            text = data.text
        }
        post.save!
        socket.emit 'post' (post)
        socket.broadcast.emit 'post' (post)