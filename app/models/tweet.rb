class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :text, Text

  has n, :tags, through: Resource
  
end
