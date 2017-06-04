class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
  property :email, String

end
