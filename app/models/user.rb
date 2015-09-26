require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password, Text
  property :password_digest, Text
  property :password_confirmation, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
