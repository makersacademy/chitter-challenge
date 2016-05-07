class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true
  property :created_at, DateTime, required: true

  belongs_to :user, required: true

end
