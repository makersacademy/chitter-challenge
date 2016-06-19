require 'data_mapper'
require 'dm-postgres-adapter'

class Post

  include DataMapper::Resource

  property :id,     Serial
  property :peep,  String
  property :author, String
  property :created_at, DateTime

end
