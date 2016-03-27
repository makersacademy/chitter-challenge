class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :text, Text, length: 120

  belongs_to :maker
end
