class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :message,    Text, lazy: false
  property :created_at, Time

  belongs_to :user
end