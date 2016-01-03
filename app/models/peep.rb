class Peep
  include DataMapper::Resource

  property :id,      Serial
  property :message, String, length: 140, required: true
  property :time,    DateTime

  belongs_to :user
end
