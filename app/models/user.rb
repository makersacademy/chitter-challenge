require './app/data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,          Serial
  property :name,        String
  property :nickname,    String
  property :email,       String
  property :password_salt, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_salt = BCrypt::Password.create(password)
  end
end
