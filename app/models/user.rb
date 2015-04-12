require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :user_name, String, unique: true, message: 'This Username is already taken'
  property :password_digest, Text
  property :email, String, unique: true, message: 'This Email is already taken'

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "Sorry, your password does not match the confirmation"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end