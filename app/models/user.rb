require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, String
  property :user_name, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
