require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class User
	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(username, password)
		user = first(username: username)
		user && BCrypt::Password.new(user.password_digest) == password ? user : nil
	end

	property :id, Serial
	property :email, String, required: true, unique: true, format: :email_address
	property :name, String, required: true
	property :username, String, required: true, unique: true
	property :password_digest, Text
	validates_confirmation_of :password
	validates_presence_of :password
	has n, :messages
end
