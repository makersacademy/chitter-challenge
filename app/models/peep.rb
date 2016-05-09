require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource


  property :id, Serial
  property :peep, Text, :lazy => false
  property :created_at, DateTime

  belongs_to :user
  has n, :comments

end
