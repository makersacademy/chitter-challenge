class Tag

  include DataMapper::Resource

  has n, :messages, through: Resource

  property :id, Serial
  property :text, String

end
