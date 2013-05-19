passport = require 'passport'

GOOGLE_CLIENT_ID      = '926245375014.apps.googleusercontent.com'
GOOGLE_CLIENT_SECRET  = 'dWFqn6r3MtHUNHq7jyFyNi3F'

GoogleStrategy = require('passport-google-oauth').OAuth2Strategy

passport.serializeUser @(user, done)
    done (nil, user)

passport.deserializeUser @(obj, done)
    done (nil, obj)

verify user (access token, refresh token, profile, done) =
    console.log 'verify user'
    // User.findOrCreate(profile.id)
    process.next tick
        done(nil, profile)

passport.use (
    @new GoogleStrategy(
        {
            clientID     = GOOGLE_CLIENT_ID
            clientSecret = GOOGLE_CLIENT_SECRET
            callbackURL  = "http://127.0.0.1:3000/auth/google/callback"
        }
        verify user
    )
)

exports.apply to (app) =
    
    app.get(
        '/auth/google'
        passport.authenticate 'google' {
            scope = [
                        'https://www.googleapis.com/auth/userinfo.profile'
                        'https://www.googleapis.com/auth/userinfo.email'
                    ]
        }
        @{}
    )
    
    app.get(
        '/auth/google/callback'
        passport.authenticate('google', { failure redirect = '/login' })
        @(req, res) @{ res.redirect('/') }
    )
