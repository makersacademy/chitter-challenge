require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :user_name, String
  property :password_digest, Text
  property :email, String

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, email, password)
    user = first(user_name: user_name, email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end