require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :encrypted_password, Text
  property :name, String
  property :username, String

  def password=(password)
    self.encrypted_password = BCrypt::Password.create(password)
  end
  
end
