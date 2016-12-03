require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :email, String
  property :cryptpass, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :passowrd

  def password=(password)
    @password = password
    self.cryptpass = BCrypt::Password.create(password)
  end
end
