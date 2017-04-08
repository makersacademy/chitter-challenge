class Peep

  include DataMapper::Resource

  has n, :hashtags, through: Resource
  
  property :id, Serial
  property :peep, Text

end
