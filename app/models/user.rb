require 'data_mapper'
require 'dm-validations'
require 'bcrypt'

class User
	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
	property :username, String, required: true, :unique => true
	property :email, String, required: true, :unique => true
	property :password_digest, Text
	property :password_token, Text

	validates_format_of :email, :as => :email_address
	validates_confirmation_of :password
	#Should not be required // validates_uniqueness_of :username

	# has n, :peeps


	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
		user = first(email: email)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end