require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :username, String
  property :name, String
  property :password_encrypt, Text

  validates_confirmation_of :password
  validates_presence_of :email

  def password=(password)
    @password = password
    self.password_encrypt = BCrypt::Password.create(password)
  end
end
