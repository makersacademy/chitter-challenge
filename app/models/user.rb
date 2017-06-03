require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :username, String
	property :email, String
	property :password_hash, Text
	
	has n, :messages, through: Resource

	def password=(password)
		@password = password
		self.password_hash = BCrypt::Password.create(password)
	end
end
