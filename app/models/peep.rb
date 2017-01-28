class Peep
	
  include DataMapper::Resource

  property :id,			Serial
  property :content,	String
  property :time,		Time

  has n, :tags, through: Resource

end
