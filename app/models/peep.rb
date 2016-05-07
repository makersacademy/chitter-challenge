# require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :contents, String
  # property :created_at, DateTime

end
