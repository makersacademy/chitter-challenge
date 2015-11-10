class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       String,   length: 1..160
  property :created_at, Time

  belongs_to :user

end