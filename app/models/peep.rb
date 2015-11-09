class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       String, :length => 0..50
  property :created_at, DateTime

  belongs_to :user

end
