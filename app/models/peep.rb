require 'dm-core'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :message,      String, length: 140
  property :created_at,   DateTime

end
