class Hashtag

  include DataMapper::Resource

  has n, :peeps, :through => Resource

  property :id, Serial
  property :text, String

end