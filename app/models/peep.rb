require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :created_on, Date

  belongs_to :user

end
