require 'bcrypt'
require 'dm-postgres-adapter'
require 'data_mapper'

class User
  attr_reader :password, :username
  attr_accessor :password
  include DataMapper::Resource


  property :id,            Serial
  property :username,      String
  property :email,         String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
