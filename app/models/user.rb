require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String, required: true
	property :email, String, required: true, format: :email_address, unique: true
	property :password_digest, String, length:60


def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

end

