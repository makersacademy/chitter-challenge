class User

  include DataMapper::Resource
  has n, :peep, through: Resource

  property :id, Serial

  property :name, String
  property :username, String, unique: true, message: "This username has been taken"
  property :email, String, unique: true, message: "This email has been registered"
  property :password, String

end
