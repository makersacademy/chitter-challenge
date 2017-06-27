class Peep
  include DataMapper::Resource
  belongs_to :user
  
  property :id, Serial
  property :content, Text
  property :posted_at, DateTime

end
