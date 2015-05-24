require 'bcrypt'

class User

	attr_reader :password, :username, :name
	attr_accessor :password_confirmation

	include DataMapper::Resource

	property :id, Serial
  property :email, String, unique: true, message: 'This email is already taken'
  property :username, String, unique: true, message: 'This username is already taken'
  property :name, String
  property :password_digest, Text

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password) #encrypts the user's password
  end

  validates_confirmation_of :password

  def self.authenticate(email, password)
  	user = first(email: email)
  	user if user && BCrypt::Password.new(user.password_digest) == password
  end

end