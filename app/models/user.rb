require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, format: :email_address, unique: true
  property :username, String, required: true, unique: true
  property :name, String, required: true, unique: true
  property :secure_password, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.secure_password = BCrypt::Password.create(password)
  end


end
