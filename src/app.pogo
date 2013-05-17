express = require 'express'
partials = require 'express-partials'
passport = require 'passport'
controller = require './controller'
auth = require './auth'

MemoryStore = express.session.MemoryStore
session store = @new MemoryStore()

app = express()

app.set('views', __dirname + '/views')
app.set('view engine', 'ejs')

app.session store = session store
app.secret = 'keyboard cat'

app.use(partials())
app.use(express.static('./public'))
app.use(express.cookie parser())
app.use(express.body parser())
app.use(express.session {
    store = session store
    secret = app.secret
})

app.use(passport.initialize())
app.use(passport.session())

auth.apply to (app)

controller.apply to (app)

module.exports = app
