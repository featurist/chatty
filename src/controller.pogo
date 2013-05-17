pogo = require 'pogo'
fs = require 'fs'
Post = require './models/post'.Post

exports.apply to (app) =
    
    ensure authenticated (req, res, next) =
        if (req.isAuthenticated ())
            next ()
        else
            res.redirect '/login'

    app.get '/' @(req, res)
        res.render 'index' { user = req.user }

    app.get '/account' (ensure authenticated) @(req, res)
        res.render 'account' { user = req.user }

    app.get '/posts' (ensure authenticated) @(req, res)
        Post.find {}.sort('date').exec @(err, posts)
            res.end(JSON.stringify(posts))

    app.get '/login' @(req, res)
        res.render 'login' { user = req.user }

    app.get '/logout' @(req, res)
        req.logout()
        res.redirect '/'

    app.get '/client' @(req, res)
        res.set header 'content-type' 'application/javascript'
        res.end(pogo.compile (fs.read file sync("#(__dirname)/client.pogo", 'utf8')))
