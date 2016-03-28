class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :body,   Text
  property :time,   DateTime

  has 1, :user, through: Resource
end
