require 'data_mapper'
require 'bcrypt'

class User

	attr_reader :password
	attr_accessor :password_confirmation

	include DataMapper::Resource

	property :id, Serial
	property :email, String, required: true
	property :username, String, required: true
	property :password, String
	property :password_confirmation, String
	# property :password_digest, Text

	# validates_confirmation_of :password
	# validates_presence_of :password
	# validates_uniqueness_of :email

	# def password=(password)
	# 	self.password_digest = BCrypt::Password.create(password)
	# end
end

