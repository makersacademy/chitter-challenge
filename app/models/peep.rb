require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :username, String
  property :user, String
  property :time, Time

end