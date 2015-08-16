class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text

  validates_presence_of :content
  validates_length_of :content, max: 140
end