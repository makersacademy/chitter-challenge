require 'bcrypt'

class User

	include DataMapper::Resource
	include BCrypt

	attr_accessor :password_confirmation
	attr_reader :password

	property :id, Serial
	property :email, String, unique: true, required: true
	property :username, String, unique: true, required: true
	property :name, String
	property :password_hash, Text

	def self.authenticate(params)
		user = first(email: params[:email])
		if user && Password.new(user.password_hash) == params[:password]
			user
		else
			false
		end
	end

	def password=(actual_password)
		@password = actual_password
		self.password_hash = Password.create(actual_password)
	end

	validates_confirmation_of :password
	validates_presence_of :password

	has n, :peeps

end