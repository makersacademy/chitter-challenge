require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  # has n, :users, through: Resource
  belongs_to :user

  property :id,         Serial
  property :message,    String
  property :added_at,   DateTime

end
