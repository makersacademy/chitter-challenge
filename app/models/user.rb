require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :encrypted_password, Text

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end
end
