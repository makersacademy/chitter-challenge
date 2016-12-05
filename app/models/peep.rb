require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :time, String
  property :body, Text
  property :user_id, Serial

  belongs_to :user

end
