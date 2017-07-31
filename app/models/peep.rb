class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :timestamp, DateTime

  belongs_to :user, required: true
end
