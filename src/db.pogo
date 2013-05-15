mongodb = require 'mongodb'
mongo connection string = process.env.MONGOLAB_URI || 'mongodb://localhost:27017/chatty'

exports.connect (callback) =
    mongodb.Db.connect (mongo connection string, callback)