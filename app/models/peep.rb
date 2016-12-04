require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :author, String
  property :date, Date
  property :time, DateTime
  property :body, Text

end
