require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, :unique => true
  property :password_digest, Text

  validates_presence_of :email
  validates_presence_of :password_confirmation
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :password, :min => 8

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
