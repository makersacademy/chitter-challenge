require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text, :required => true, :lazy => false
  property :created_at, DateTime
end
