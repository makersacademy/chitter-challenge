
class Hashtag
  include DataMapper::Resource

  property :id, Serial
  property :tag, String

  has n, :peeps, :through => Resource

end