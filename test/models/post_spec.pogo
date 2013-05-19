assert = require './mongoose_assertions'
db = require '../../src/db'
Post = require '../../src/models/post'.Post

describe 'Post'
    
    before
    
        db.connect!
    
    before each
    
        Post.remove! {}
    
    describe 'with valid fields'
    
        it 'is valid'
            post = @new Post {
                text = 'hola'
                user = {
                    name = {
                        given name = 'dave'
                        family name = 'brown'
                    }
                }
            }
            post.save!
    
    describe 'without text'

        it 'is invalid'
            post = @new Post { user = 'dave' }
            assert.invalid! (post)