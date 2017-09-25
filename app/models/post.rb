require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'pg'
# for handling posts to the main page
class Post
  include DataMapper::Resource

  property :id, Serial
  property :body, String
  property :created_at, DateTime
end
