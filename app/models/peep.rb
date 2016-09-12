require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :author, 

end
