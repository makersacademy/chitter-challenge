require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password, :email
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email

  property  :id, Serial
  property  :name, String, required: true
  property  :email, String
  property  :username, String
  property  :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
