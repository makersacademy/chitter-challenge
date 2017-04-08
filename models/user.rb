# Creates new uses with user information
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :name, String
  property :username, String, required: true, unique: true

  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
