require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :email, String
  property :password_digest, Text

  property :name, String
  property :username, String

  def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end