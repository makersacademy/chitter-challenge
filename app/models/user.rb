require 'bcrypt'
require 'data_mapper'

class User

  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :email, String, unique: true
  property :username, String, unique: true
  property :password_digest, Text
  #
  # def password=(password)
  #   @password = password
  #   self.password_digest = BCrypt::Password.create(password)
  # end
end
