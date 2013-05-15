passport stub = require 'passport-stub'
supertest     = require 'supertest'
app           = require '../src/app'

passport stub.install (app)
req = supertest (app)

describe 'GET /account'
    
    it 'responds with 302 when not logged in'
        req.get('/account').expect(302).end!

    it 'responds with 200 when logged in'
        passport stub.login { username = 'bruce.lee' }
        req.get('/account').expect(200).end!
