require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :username, String
	property :email, String
	property :password_hash, Text

	has n, :messages

	validates_confirmation_of :password

	attr_reader :password
	attr_accessor :password_confirmation

	def password=(password)
		@password = password
		self.password_hash = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
	   user = first(email: email)
	   if user && BCrypt::Password.new(user.password_hash) == password
		user
	    else     
  	         nil
	    end
	end
end

