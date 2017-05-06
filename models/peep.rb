class Peep
  include DataMapper::Resource

  has 1, :user, through: Resource
  has n, :responses, through: Resource

  property :id, Serial
  property :content, String, required: true
  property :created_at, DateTime

  validates_presence_of :content
end
