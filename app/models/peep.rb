class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  String
  property :time,     DateTime
  property :username, String
  property :name,     String  

  has 1, :user, through: Resource

end
