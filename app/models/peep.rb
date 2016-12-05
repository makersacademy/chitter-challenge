require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :content, String, :length => 1..255

  belongs_to :user

end
