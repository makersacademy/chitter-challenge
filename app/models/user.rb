require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :user_name, String
  property :email, String
  property :password_digest, Text

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, message: "Password mismatch"

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end
end
