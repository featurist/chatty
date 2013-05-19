connect = require 'express/node_modules/connect'
cookie = require 'express/node_modules/cookie'
parse cookie = connect.utils.parseSignedCookie

Session = connect.middleware.session.Session

exports.apply to (io, app) =

    io.configure
        io.set 'authorization' @(data, accept)
            if (data.headers.cookie)
                data.cookie = cookie.parse(data.headers.cookie)
                data.sessionID = parse cookie(data.cookie.'connect.sid', app.secret)
                data.sessionStore = app.session store
                app.session store.get (data.sessionID) @(err, session)
                    if (err || !session)
                        accept('Error', false)
                    else
                        data.session = @new Session(data, session)
                        accept(null, true)
            else
                return accept('No cookie transmitted', false)
        
            accept(null, true)
