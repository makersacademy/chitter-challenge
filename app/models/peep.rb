class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :peep,   String
  property :user,   String
  property :created_at, DateTime

end
