require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String, required: true
  property :created_at, DateTime

  belongs_to :user

end