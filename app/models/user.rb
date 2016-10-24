require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id,              Serial
  property :name,            String
  property :username,        String, unique: true
	property :email,           String, required: true, format: :email_address, unique: true
	property :password_digest, Text

	validates_confirmation_of :password

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

  def self.authenticate(email, password)
	  user = first(email: email)
	  if user && BCrypt::Password.new(user.password_digest) == password
	    user
	  else
	    nil
	  end
	end
end
