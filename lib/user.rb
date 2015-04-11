require 'bcrypt'
require 'data_mapper'

class User

  include DataMapper::Resource

  property :user_id, Serial
  property :username, String
  property :real_name, String
  property :email, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
