require 'pg'

class User 
	attr_reader :name, :surname, :user_name, :email, :password, :status

	def initialize(name, surname, user_name, email, password)
		@name = name
		@surname	= surname
		@user_name = user_name
		@email = email
		@password = password
	end

	def signed_in?
		@status = false
	end

	def sign_in
		@status = true
	end

	def log_out
		@status = false
	end
end
