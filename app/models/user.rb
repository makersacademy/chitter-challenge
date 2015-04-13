require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,       Serial
  property :name,     String
  property :username, String, unique: true, message: 'This username has been already taken'
  property :email,    String, unique: true, message: 'This email address has been already taken'
  property :password_digest, Text

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
