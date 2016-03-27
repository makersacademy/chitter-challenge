class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :text, Text, length: 120
  property :time, String

  belongs_to :maker
end
