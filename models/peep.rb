# Post messages on the homepage from the user

class Peep

  include DataMapper::Resource

  has n, :user, through: Resource

  property :id, Serial
  property :message, String
  property :username, String
  property :created_at, DateTime

end
