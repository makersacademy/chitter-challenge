class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       String,   length: 1..160
  property :created_at, DateTime

  belongs_to :user

end