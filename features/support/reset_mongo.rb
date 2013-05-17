require 'mongo'

include Mongo

module ResetMongo
  def reset_mongo!
    @client ||= MongoClient.new('localhost', 27017)
    @db     ||= @client['chatty']
    @posts  ||= @db['posts']
    @posts.remove
  end
end
World(ResetMongo)

Before do
  reset_mongo!
end