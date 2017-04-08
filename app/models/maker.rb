class Maker

  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password, String

end
