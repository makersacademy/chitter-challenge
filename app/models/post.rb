require 'data_mapper'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :peep, String, :required => true
  property :created_at, DateTime
end