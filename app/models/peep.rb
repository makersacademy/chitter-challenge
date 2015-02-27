class Peep

  include DataMapper::Resource

  has n, :hashtags, :through => Resource

  property :id, Serial
  property :user, String
  property :message, String


end