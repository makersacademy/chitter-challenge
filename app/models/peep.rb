class Peep
  include DataMapper::Resource

  belongs_to :user, required: true

  property :id, Serial
  property :message, String
  property :timestamp, DateTime


end
