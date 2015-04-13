class Tag

  include DataMapper::Resource

  has n, :convo, through: Resource

  property :id, Serial
  property :text, String

end