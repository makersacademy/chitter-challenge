
class Link
  include DataMapper::Resource

  has n, :tags, through: Resource
  # has n, :users, through: Resource

  property :id,     Serial
  property :title,  String
  property :url,    String

end
