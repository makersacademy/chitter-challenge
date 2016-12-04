require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  propery :peep, String
  property :created_at, DateTime

end
