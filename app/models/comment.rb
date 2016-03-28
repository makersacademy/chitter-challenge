require 'data_mapper'
require 'dm-postgres-adapter'

class Comment
  include DataMapper::Resource



  property :id, Serial
  property :body, Text, :lazy => false
  property :created_at, DateTime

  belongs_to :peep

end
