require 'dm-postgres-adapter'
require 'dm-timestamps'

class Post

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :tweet, String
  property :created_at, DateTime
end
