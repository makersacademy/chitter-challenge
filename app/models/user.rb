require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :name, String
  property :secure_password, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.secure_password = BCrypt::Password.create(password)
  end


end
