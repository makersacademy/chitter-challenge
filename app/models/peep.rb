class Peep
  include DataMapper::Resource

  property :id,              Serial
  property :message,         String, required: true
  property :time,            DateTime

  belongs_to :user
end
