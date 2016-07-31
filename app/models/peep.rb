class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :comment,      String
  property :author,       String
  property :created_at,   DateTime

  has n, :replys, through: Resource

end
