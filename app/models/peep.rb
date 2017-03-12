class Peep
  include DataMapper::Resource

  has n, :hashtags, through: Resource
  
  property :id, Serial
  # property :name, String
  # property :username, String
  property :content, Text

  # belongs to :user

end
