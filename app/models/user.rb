require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

	attr_reader :password
	attr_accessor :password_confirmation
	
	include DataMapper::Resource

	property :id, Serial
	property :firstname, String, required: true
	property :surname, String, required: true
	property :username, String, required: true
	property :email, String, required: true
	property :encrypted_password, Text

	validates_confirmation_of :password
	validates_format_of :email, as: :email_address

	def password=(password)
		@password = password
		self.encrypted_password = BCrypt::Password.create(password)
	end

end