require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String
  property :encrypted_password, Text
  property :name, String
  property :username, String

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
end
