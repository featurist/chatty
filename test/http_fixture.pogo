httpism = require 'httpism'
app = require '../src/app'

exports.describe (behaviour, examples) =

    describe (behaviour)
    
        server = nil
    
        before
            server := app.listen(3001)
        
        after
            server.close()
    
        examples(httpism.resource 'http://localhost:3001')