Post = require './models/post'.Post

exports.apply to (io, app) =
    
    app.post '/post' @(req, res)
        
        post = @new Post (req.body)
        post.save @(err)
            if (!err)
                io.sockets.emit 'post' (post)
                res.end '{}'
