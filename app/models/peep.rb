class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String

  has 1, :user, through: Resource
end
