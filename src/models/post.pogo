mongoose = require 'mongoose'

Schema = mongoose.Schema

schema = @new Schema {
    text = { type = String, required = true }
    date = { type = Date,   required = true }
    user = {
        name = {
            given name = { type = String, required = true }
            family name = { type = String, required = true }
        }
    }
}

schema.pre 'validate' @(next)
    if (!this.date) @{ this.date = @new Date }
    next()

exports.Post = mongoose.model ('Post', schema)