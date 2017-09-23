require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property(:id, Serial)
  property(:real_name, String)
  property(:username, String)
  property(:email_address, String)
  property(:password_digest, Text)

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
