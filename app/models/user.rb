require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation
	validates_confirmation_of :password
	validates_format_of :email, as: :email_address

  property :id, Serial
  property :username, String, required: true, unique: true
	property :email, String, required: true, unique: true
	property :name, String
	property :password_digest, String, length: 60

	has n, :chits

	def password=(password)
		@password = password
	 	self.password_digest = BCrypt::Password.create(password)
 	end

	def self.authenticate(username, password)
  	user = first(username: username)
		if user && BCrypt::Password.new(user.password_digest) == password
    	user
  	else
    	nil
  	end
	end
end
