require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  String
  property :author,   String
  property :handle,   String
  property :time,     Time

end
