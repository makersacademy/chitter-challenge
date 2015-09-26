class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  String
  property :time,     DateTime

  has n, :user, through: Resource

end
