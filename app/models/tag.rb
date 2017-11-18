class Tag
  include DataMapper::Resource

  property :id, Serial
  property :content, String, :required => true
  property :created_at, DateTime

  # has 1, :user, through: Resource
  # has n, :peeps, through: Resource
end
