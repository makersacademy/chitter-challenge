require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,               Serial
  property :email,            String
  property :password_digest,  Text
  property :name,             String
  property :surname,          String
  property :username,         String

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
