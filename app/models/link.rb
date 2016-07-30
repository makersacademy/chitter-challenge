class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String, length: 160
  property :url, String
  property :created_at, DateTime
end
