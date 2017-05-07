class Response
  include DataMapper::Resource

  has 1, :peep, through: Resource

  property :id, Serial
  property :content, String, required: true
  property :created_at, DateTime
  
  validates_presence_of :content
end
