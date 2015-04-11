class Cheep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  has 1, :user, through: Resource
end