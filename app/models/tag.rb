class Tag
  include DataMapper::Resource
  property :id, Serial
  property :text, String

  has n, :peeps, through: Resource

 end 