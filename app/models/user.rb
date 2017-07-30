require './app/data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :nickname,    String
  property :email,       String
  property :password_salt, Text

  def password=(password)
    self.password_salt = BCrypt::Password.create(password)
  end
end
