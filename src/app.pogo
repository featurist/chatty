express = require 'express'
partials = require 'express-partials'
passport = require 'passport'
auth = require './auth'
pogo = require 'pogo'
fs = require 'fs'

app = express()

app.set('views', __dirname + '/views')
app.set('view engine', 'ejs')

app.use(partials())
app.use(express.static('./public'))
app.use(express.cookie parser())
app.use(express.body parser())
app.use(express.session { secret = 'keyboard cat' })
app.use(passport.initialize())
app.use(passport.session())

auth.apply to (app)

ensure authenticated (req, res, next) =
    if (req.isAuthenticated ())
        next ()
    else
        res.redirect '/login'

app.get '/' @(req, res)
    res.render 'index' { user = req.user }

app.get '/account' (ensure authenticated) @(req, res)
    res.render 'account' { user = req.user }

app.get '/login' @(req, res)
    res.render 'login' { user = req.user }

app.get '/logout' @(req, res)
    req.logout()
    res.redirect '/'

app.get '/client' @(req, res)
    res.set header 'content-type' 'application/javascript'
    res.end(pogo.compile (fs.read file sync("#(__dirname)/client.pogo", 'utf8')))

module.exports = app
