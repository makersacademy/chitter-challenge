class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, message: "That email is already taken"
  property :name, String
  property :username, String, unique: true, message: "That UN is already taken"
  property :password, Text

  has n, :peeps

end
