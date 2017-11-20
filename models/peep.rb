class Peep
  include DataMapper::Resource

  property :id,        Serial
  property :message,   Text, required: true
  property :time,      String
  belongs_to :user
end
