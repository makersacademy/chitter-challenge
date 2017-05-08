require 'bcrypt'

class User
	include DataMapper::Resource

	property :id, Serial
	property :name, String, required: true
	property :email, String, format: :email_address, required: true, unique: true
	property :username, String, required: true, unique: true
	property :password_digest, Text, required: true

	has n, :messages

	def password=(password)
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.auth(username, password)
		user = first(username: username)
		user if user && BCrypt::Password.new(user.password_digest) == password
	end
end