require 'bcrypt'


class User
	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
	property :email, String, unique: true, format: :email_address, required: true
	property :name, String
	property :username, String, unique: true, required: true
	property :password_digest, Text 

	validates_confirmation_of :password

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end
end

