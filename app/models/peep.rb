
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text, required: true
  property :created_at, DateTime

  validates_presence_of :text
end
