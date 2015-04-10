class Convo

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :message, String

end