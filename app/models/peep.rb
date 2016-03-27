class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :text, Text, length: 120
end
