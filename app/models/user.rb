require 'bcrypt'

class User
	include DataMapper::Resource

	property :id, Serial
	property :name, String, required: true
	property :email, String, required: true
	property :username, String, required: true
	property :password_digest, Text, required: true

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end
end