require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
include DataMapper::Resource
include BCrypt

  property :id,             Serial
  property :name,           String
  property :email,          String
  property :password_hash,  Text
  property :username,       String

  attr_reader :password

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
