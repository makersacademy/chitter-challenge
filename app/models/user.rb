require 'bcrypt'

class User
attr_reader :password
attr_reader :username

	include DataMapper::Resource

	# validates_confirmation_of :password
	# validates_presence_of :email
	# validates_format_of :email, as: :email_address

	property :id, Serial
	property :email, String, format: :email_address, required: true, unique: true
	property :username, String, length: 10
	property :password_digest, String, length: 60

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

  # def self.authenticate(email, password)
  #   user = first(email: email)
  #   if user && BCrypt::Password.new(user.password_digest) == password
  #     user
  #   else
  #     nil
  #   end
  # end
end
