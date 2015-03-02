class Peep

  include DataMapper::Resource

  has n, :hashtags, :through => Resource
  belongs_to :maker

  property :id, Serial
  property :user, String
  property :message, String


end