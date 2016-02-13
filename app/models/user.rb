require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,                 Serial
  property :email,              String
  property :password_digest,    Text
  property :name,               Text
  property :username,           Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
