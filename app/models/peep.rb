class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true
  property :time,  Text, required: true

  belongs_to :user
end
