mongoose = require 'mongoose'
mongo connection string = process.env.MONGOLAB_URI || 'mongodb://localhost:27017/chatty'

exports.connect (callback) =
    mongoose.connect (mongo connection string, callback)