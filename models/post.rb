require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text
  property :inception, DateTime

end
