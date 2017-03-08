class Peep
	
  include DataMapper::Resource

  property :id,				Serial
  property :user_handle,	String
  property :user_name,		String
  property :content,		String,  :length => 140
  property :time,			Time

  has n, :tags, through: Resource

end
