require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :name, String
  property :password_digest, Text
  property :email, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.verify(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
