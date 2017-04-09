class Peep

  include DataMapper::Resource

  has 1, :user, through: Resource

  property :id, Serial
  property :text, String
  property :time, String

end
