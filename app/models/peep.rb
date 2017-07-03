
require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :content, String
  property :created_at, DateTime

end
