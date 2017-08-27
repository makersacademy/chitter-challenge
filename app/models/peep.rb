require 'dm-migrations'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :time, Time

end
