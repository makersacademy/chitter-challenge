require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,       Serial
  property :username, String, required: true
  property :email,    String, required: true
  property :password_digest, Text

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end