class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :username, String 

  has 1, :user, through: Resource

end
