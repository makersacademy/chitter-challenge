require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :posted_at, DateTime

end
