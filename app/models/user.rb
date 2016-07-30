require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property  :id, Serial
  property  :name, String, required: true
  property  :email, String, format: :email_address, required: true
  property  :username, String, required: true
  property  :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
