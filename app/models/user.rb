require "data_mapper"
require "dm-timestamps"
require "bcrypt"

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :name, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
