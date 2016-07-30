require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password

  property  :id, Serial
  property  :name, String, required: true
  property  :email, String, format: :email_address, required: true, unique: true
  property  :username, String, required: true, unique: true
  property  :password_digest, String, length: 60, required: true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
