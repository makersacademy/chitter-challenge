require 'bcrypt'

class Feed
  include DataMapper::Resource

  attr_accessor :peeps

  property :id, Serial
  property :peep, String
  property :name, String

end
