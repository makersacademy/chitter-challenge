require 'dm-validations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text
end
